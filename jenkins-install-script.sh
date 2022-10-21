#!/bin/bash

echo "starting jenkins installation, this will take a few min..."

sudo yum install java-11-openjdk-devel -y
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
if [ $? -eq 0 ] 
then
echo "Packages have been successfully INSTALLED"
else
echo "packages installation FAILED"
fi
