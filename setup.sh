#!/usr/bin/bash

echo "Installing basic things..."
sudo apt update
sudo apt install curl exfat-fuse exfat-utils gcc g++ make build-essential wget htop terminator slack -y
sudo sysctl net.ipv6.conf.all.disable_ipv6=1  # quick fix for add-apt-repository to work faster
echo "DONE!"

echo "Installing VSCode"
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code -y
echo "DONE!"


echo "Lets install Docker"
sudo apt remove docker docker-engine docker.io -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common     -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install docker-ce docker-compose -y
sudo docker run hello-world
sudo usermod -aG docker $USER
echo "Now you can use docker with no sudo. But you need to logout before use it."
echo "DONE!"


echo "Installing NodeJs 15"
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
sudo apt update
sudo apt install nodejs -y

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb [arch=amd64] https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update 
sudo apt install yarn -y
echo "DONE!"

echo "Installing Java 15"
sudo add-apt-repository ppa:linuxuprising/java -y
sudo apt install oracle-java15-installer -y
echo "DONE!"

echo "Installing miscellaneous"
sudo apt install steam -y
echo "DONE!"

echo "Installing K3D"
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v3.4.0 bash

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

echo "DONE!"

echo "Installing Python 3.9"
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev -y
curl https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz --output Python-3.9.1.tgz
tar xf Python-3.9.1.tgz
cd Python-3.9.1
./configure --enable-optimizations
make -j 12
sudo make altinstall
sudo rm -rf Python-3.9.1*
echo "DONE!"


sudo apt upgrade
sudo apt autoremove -y