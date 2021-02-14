module "mysg" {
  source = "../modules/securitygroup"
  sgtag  = "my_web_access1"
}

module "myec2" {
  source        = "../modules/ec2"
  instance_type = "t2.micro"
  ec2_count     = 1
  keyname       = "pretty"
  sg_id         = [module.mysg.security_group_id]
  instance_name = "Jenkins"
}