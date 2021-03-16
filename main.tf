provider "alicloud" {
  region = "cn-beijing"
}

resource "alicloud_waf_instance" "this" {
  big_screen           = "0"
  exclusive_ip_package = "1"
  ext_bandwidth        = "50"
  ext_domain_package   = "1"
  package_code         = "version_3"
  prefessional_service = "false"
  subscription_type    = "Subscription"
  period               = 1
  waf_log              = "false"
  log_storage          = "3"
  log_time             = "180"
}

resource "alicloud_waf_domain" "this" {
  domain            = "www.aliyun.com"
  instance_id       = alicloud_waf_instance.this.id
  is_access_product = "On"
  source_ips        = ["1.1.1.1"]
  cluster_type      = "PhysicalCluster"
  http2_port        = [443]
  http_port         = [80]
  https_port        = [443]
  http_to_user_ip   = "Off"
  https_redirect    = "Off"
  load_balancing    = "IpHash"
  log_headers {
    key   = "foo"
    value = "http"
  }
}