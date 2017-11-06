/*
Small example to create EIP and associate it using aws_eip_association, instead of using this:

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

*/

provider "aws" {
  region     = "eu-west-1"
  version    = "~> 1.2"
}

resource "aws_instance" "example" {
  ami           = "ami-acd005d5"
  instance_type = "t2.small"
  lifecycle {
    create_before_destroy = true
  }
  tags {
    Name = "MyTerraformInstance"
  }
}

resource "aws_eip" "exampleIP" {
  
}

resource "aws_eip_association" "instance_eip_assoc" {
  instance_id   = "${aws_instance.example.id}"
  allocation_id = "${aws_eip.exampleIP.id}"
}

