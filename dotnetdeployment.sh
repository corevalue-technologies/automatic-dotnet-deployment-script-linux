#!/bin/bash
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-runtime-3.0
sudo apt-get install nginx
sudo apt-get update
sudo apt-get install dotnet-sdk-3.0
sudo rm /etc/nginx/sites-available/default
sudo mv /home/default /etc/nginx/sites-available/
sudo touch /etc/nginx/conf.d/timeout.conf
sudo chmod -R 777 /etc/nginx/conf.d/timeout.conf
sudo echo "proxy_connect_timeout 600;" >> /etc/nginx/conf.d/timeout.conf  
sudo echo "proxy_send_timeout 600;" >> /etc/nginx/conf.d/timeout.conf 
sudo echo "proxy_read_timeout 600;" >> /etc/nginx/conf.d/timeout.conf 
sudo echo "send_timeout 600;" >> /etc/nginx/conf.d/timeout.conf 
sudo nginx -s reload
sudo chmod 777 /var/www/html/
sudo mv /home/publish/* /var/www/html/
sudo chmod -R 777 /var/www/html/
cd /var/www/html/
dotnet <FileName>.dll &