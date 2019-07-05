#!/bin/bash
#
# [Quick LEMP install Server Script]
#
# GitHub:   https://github.com/felixnyamweya/lemp-x
# Author:   Felix Nyamweya
# URL:      https://felix.co.ke
#


#updating packages
echo -e "\nUpdating package lists..\n"
sudo apt-get -y update

#install Ngnix
echo -e "\nInstalling Ngnix server...\n"
sudo apt-get -y install nginx


#install Mysql server
echo -e "\nInstalling Mysql server...\n"
#default password is root
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get -y install mysql-server

#install Mysql server
echo -e "\nInstalling PHP-FPM and Mysql extension for PHP...\n"
sudo apt-get -y install php7.2-fpm php-mysql

#Move nginx conf file to enable php support on ngnix
echo -e "\nMoving Nginx configuration file...\n"
sudo cp default /etc/nginx/sites-available

#Move php testing file
echo -e "\nMoving php testing file...\n"
sudo cp info.php /var/www/html/

sudo systemctl restart nginx.service

echo -e "\n\nLEMP Stack installed successfully :)\n"

echo -e "\n Open following link to check installed PHP configuration http://localhost/info.php"
