#Secure-SSH.SH
#Creates a new ssh user called $1
#Adds a public key to that users authorized keys file
#Removes roots ability to ssh in

USER=$1
sudo useradd $USER
sudo mkdir /home/$USER/.ssh
sudo cp linux/public-keys/sys265.pub /home/$USER/.ssh/authorized_keys
sudo chmod 700 /home/$USER/.ssh
sudo chmod 600 /home/$USER/.ssh/authorized_keys
sudo chown -R $USER:$USER /home/$USER/.ssh
sudo sed 's/AllowUsers joseph/AllowUsers joseph, '$USER'/g' /etc/ssh/sshd_config
sudo sed 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config
sudo sed's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo sed 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
