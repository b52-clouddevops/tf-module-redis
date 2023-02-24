# Creates CNAME record for the docdb endpoint.
resource "aws_route53_record" "record" {
  zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTEDZONE_ID
  name    = "redis-${var.ENV}.${data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTEDZONE_NAME}"
  type    = "CNAME"
  ttl     = 10
  records = [aws_elasticache_cluster.redis.cache_nodes[0].]
}

output "redis" {
    value = aws_elasticache_cluster.redis
}