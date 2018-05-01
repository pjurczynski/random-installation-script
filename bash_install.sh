cd ~
mkdir ~/programs
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:kelleyk/emacs
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo add-apt-repository -y ppa:aacebedo/fasd
sudo add-apt-repository -y ppa:zeal-developers/ppa
sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# mongo repository
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list


sudo su
    # i3wm repository
    /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f
    dpkg -i ./keyring.deb
    echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
exit

sudo apt --allow-unauthenticated -y update

sudo apt -y install software-properties-common
sudo apt -y install build-essential tcl

# edit terminal profile options > commands > run as login shell
sudo apt -y install rbenv
rbenv init
rvm install ruby
rvm @global do gem install bundler pry pry-doc ruby_parser rubocop

sudo apt -y install git
sudo apt -y install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt -y install emacs25
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/borgnix/spacemacs-journal.git ~/.emacs.d/private/journal
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
nvm install node
sudo apt -y install xclip
sudo apt -y install xsel
sudo apt -y install parcellite
sudo apt -y install neovim
sudo apt -y install i3
sudo apt -y install tmux
sudo apt -y install rxvt-unicode
sudo apt -y install xfonts-jmk
sudo apt -y install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
sudo apt -y install libcairo2-dev libjpeg-dev libgif-dev
sudo apt -y install memcached
sudo apt -y install mc
sudo apt -y install silversearcher-ag
sudo apt -y install exuberant-ctags python-pygments
sudo apt -y install libgtk-3-dev
sudo apt -y install yarn
sudo apt -y install fasd
sudo apt -y install rofi
sudo apt -y install global
sudo apt -y install zeal
sudo mv /usr/bin/dmenu dmenu_bak
sudo ln -s rofi dmenu

#unison
sudo apt -y install ocaml
cd /tmp/
wget https://github.com/bcpierce00/unison/archive/2.48.4.tar.gz
tar xvf 2.48.4.tar.gz
cd unison-2.48.4
make UISTYLE=text
sudo cp src/unison /usr/local/bin/unison
sudo cp src/unison-fsmonitor /usr/local/bin/unison-fsmonitor

# gtags
cd ~/programs
latestGlobal=$(curl www.gnu.org/software/global/download.html | grep http.*?global-.*?.tar.gz -P -o)
wget $latestGlobl
tar xvf global-.*.tar.gz
rm global-*.tar.gz
latestGlobalName=$(ls | grep global-.* -o)
cd $latestGlobalName
./configure --with-exuberant-ctags=/usr/bin/ctags
make
sudo make install

# docker-compose
latestDocker=$(curl https://github.com/docker/compose/releases/latest | cut -d/ -f8 | cut -d\" -f1)
curl -L https://github.com/docker/compose/releases/download/$latestDocker/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null
sudo chmod +x /usr/local/bin/docker-compose

# systemd manager
cd ~/programs/
git clone https://github.com/mmstick/systemd-manager
cd systemd-manager
sudo apt install cargo libgtk-3-dev
make
sudo make install

# redis
cd /tmp
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
cd redis-stable
make
make test
sudo make install

# mongo
sudo apt-get install -y --allow-unauthenticated mongodb-org
sudo cp ./mongod.service /lib/systemd/system/

mysql
postgresql

git clone https://github.com/pjurczynski/dotfiles.git ~/.dotfiles

# base 16
git clone https://github.com/chriskempson/base16-gnome-terminal.git ~/.config/base16-gnome-terminal
source ~/.config/base16-gnome-terminal/base16-default.dark.sh
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# docker
sudo apt -y install apt-transport-https ca-certificates curl
sudo apt -y install docker-ce

#setup cron:
$USER_HOME=/home/szujek/
sudo su
crontab -e
0 0 * * * $USER_HOME/.dotfiles/upgrade_apps

# install heroku
sudo apt-get install heroku

npm -g install eslint scss-lint jshint js-beautify eslint-config-google
