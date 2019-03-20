provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "instance" {
  ami = "ami-08660f1c6fb6b01e7"
  instance_type = "t2.medium"
  key_name = "user5"
  tags = {
    Name = "fun"
  }
 provisioner "remote-exec"{
  inline=["sudo apt-get -y install python"]
  connection{
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/home/ubuntu/user5")}"

    }
 }
}
