#!/bin/bash
mensagem de função {
  BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
  AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' && PRETO='\e[1m' && SEMCOR='\e[0m'
  caso $ 1 em
  -ne) cor="${RED}${BLACK}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -ama) cor="${AMARELO}${PRETO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verm) cor="${AMARELO}${PRETO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -azu) cor="${MAG}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -verd) cor="${GREEN}${BLACK}" && echo -e "${cor}${2}${SEMCOR}" ;;
  -bra) cor="${RED}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -nazu) cor="${COLOR[6]}${BLACK}" && echo -ne "${cor}${2}${SEMCOR}" ;;
  -gri) cor="\e[5m\033[1;100m" && echo -ne "${cor}${2}${SEMCOR}" ;;
  "-bar2" | "-bar") cor="${RED}—————————————————————————————————————— ——————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}" ;;
  esac
}
função fun_bar {
  comando="$1"
  _=$(
    $comando >/dev/null 2>&1
  ) &
  >/dev/null
  pid=$!
  while [[ -d /proc/$pid ]]; Faz
    echo -ne " \033[1;33m["
    para ((i = 0; i < 20; i++)); Faz
      echo -ne "\033[1;31m##"
      dormir 0,5
    feito
    echo -ne "\033[1;33m]"
    dormir 1s
    eco
    tput cuu1
    tput dl1
  feito
  echo -e " \033[1;33m[\033[1;31m################################# #######\033[1;33m] - \033[1;32m100%\033[0m"
  dormir 1s
}
função print_center {
  if [[ -z $2 ]]; então
    texto="$1"
  senão
    col="$1"
    texto="$2"
  fi

  enquanto lê a linha; Faz
    espaço não definido
    x=$(((54 - ${#line}) / 2))
    for ((i = 0; i < $x; i++)); Faz
      espaço+=' '
    feito
    espaço+="$linha"
    if [[ -z $2 ]]; então
      msg -azu "$espaço"
    senão
      msg "$col" "$espaço"
    fi
  feito <<<$(echo -e "$texto")
}

título da função {
  Claro
  msg -bar
  if [[ -z $2 ]]; então
    print_center -azu "$1"
  senão
    print_center "$1" "$2"
  fi
  msg -bar
}

função stop_install {
  [[! -e /bin/pweb ]] && {
    título "INSTALAÇÃO CANCELADA"
    Claro
    cat /dev/null > ~/.bash_history && history -c
    rm /bin/ubuinst* > /dev/null 2>&1
    saída;
 } || {
    título "INSTALAÇÃO CANCELADA"
    Claro
    cat /dev/null > ~/.bash_history && history -c
    rm /bin/ubuinst* > /dev/null 2>&1
    saída;
}
}

função os_system {
  system=$(cat -n /etc/issue | grep 1 | cut -d ' ' -f6,7,8 | sed 's/1//' | sed 's/ //')
  distro=$(echo "$system" | awk '{print $1}')

  caso $distro em
  Debian) vercion=$(echo $system | awk '{print $3}' | cut -d '.' -f1) ;;
  Ubuntu) vercion=$(echo $system | awk '{print $2}' | cut -d '.' -f1,2) ;;
  esac
}
dependências da função {
  soft="python bc screen at nano unzip lsof netstat net-tools dos2unix nload jq python3 python-pip"
   para i em $soft; Faz
    comprimento="${#i}"
    pontos=$((21 - $long))
    pt="."
    for ((a = 0; a < $pontos; a++)); Faz
      pt+="."
    feito
    msg -nazu " INSTALANDO $i$(msg -ama "$pts")"
    se apt instalar $i -y &>/dev/null; então
      msg -verd "INSTALADO"
    senão
      msg -verm2 "ERRO"
      dormir 2
      tput cuu1 && tput dl1
      print_center -ama "APLICANDO FIX A $i"
      dpkg --configure -a &>/dev/null
      dormir 2
      tput cuu1 && tput dl1

      msg -nazu " INSTALANDO $i$(msg -ama "$pts")"
      se apt instalar $i -y &>/dev/null; então
        msg -verd "INSTALADO"
      senão
        msg -verm2 "ERRO"
      fi
    fi
  feito
}
função install_start {
if [[ -e "/var/www/html/pages/system/pass.php" ]]; então
Claro
msg -bar
echo -e "\033[1;31mO PAINEL JÁ ESTÁ INSTALADO EM SUA VPS, RECOMENDO\033[0m"
echo -e "\033[1;31mUMA FORMATAÇÃO PARA UMA NOVA INSTALAÇÃO!\033[0m"
dormir 5
systemctl reinicie o apache2 > /dev/null 2>&1
cat /dev/null > ~/.bash_history && history -c
rm /bin/ubuinst* > /dev/null 2>&1
saída;
senão
  echo -e 'por: @CLODTECHMT' >/usr/lib/telegram
  echo -e "\e[1;97m \e[5m\033[1;100m INSTALADOR PAINEL WEB CLODTECH \033[1;37m""
 echo -e "\033[1;37m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ━━━━━━━━━━━━━━━━━━━━━━━┓\033[0m"
echo -e "\033[1;37m┃[ ! ] ESTA INSTALAÇÃO FORNECE UM CONJUNTO DE FERRAMENTAS PARA\033[38;5;197m\033[38;5;197m\033[1;37m ┃\E[0m"
echo -e "\033[1;37m┃GESTÃO E IMPLEMENTAÇÃO VPN UTILIZANDO OS SERVIDORES UBUNTU 18\033[38;5;197m\033[38;5;197m\033[1;37m ┃\E[0m""
echo -e "\033[1;37m┃[ ! ] O USUÁRIO É RESPONSAVEL A QUALQUER DANO/MÁ UTILIZAÇÃO.\033[38;5;197m\033[38;5;197m\033[1;37m ┃\E [0m"
echo -e "\033[1;37m┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ━━━━━━━━━━━━━━━━━━━━━━━┛\033[0m"
  msg -ne "\033[1;37m┗━┫ VAMOS INICIAR? [S/N]:\033[38;5;197m\033[38;5;197m\033[1;37m"
  leia a opção
  [[ "$opcion" != @(s|S) ]] && stop_install
  limpar && limpar
  os_system
  msg -bar
  echo -e "\e[1;97m \e[5m\033[1;100m ATUALIZAÇÃO DO SISTEMA \033[1;37m""
  msg -bar
  apt instalar software-propriedades-comum
  apt update -y
  apt instalar figlet -y
  apt install curl -y
  add-apt-repository ppa:ondrej/php -y
  apt update -y
  apt upgrade -y
  Claro
  msg -bar
  echo -e "\e[1;97m \e[5m\033[1;100m A ATUALIZAÇÃO FOI UM SUCESSO! \033[1;37m""
  msg -bar
  dormir 3
  Claro
fi
}

função instalar_continuar {
  os_system
  msg -bar
  echo -e " \e[5m\033[1;100m INSTALANDO PACOTES PARA O SCRIPT \033[1;37m"
  msg -bar
  print_center -ama "$distro $vercion"
  print_center -verd "INSTALANDO DEPENDÊNCIAS"
  msg -bar3
  dependências
  msg -bar3
  print_center -azu "Removendo pacotes obsoletos"
  apt autoremove -y &>/dev/null
  dormir 2
  tput cuu1 && tput dl1
  msg -bar
  print_center "Se algumas das dependências - comandoemamama"
  msg -bar
  read -t 60 -n 1 -rsp $'\033[1;39m << pressione qualquer tecla para continuar >>\n'
}
função install_continue2 {
cd /bin || saída
rm pweb > /dev/null 2>&1
wget https://github.com/cloudnetbr/pweb/raw/instalar/pweb > /dev/null 2>&1
chmod 777 pweb > /dev/null 2>&1
Claro
[[! -d /bin/ppweb ]] && mkdir /bin/ppweb
cd /bin/ppweb || saída
rm *.sh ver* > /dev/null 2>&1
wget https://github.com/cloudnetbr/pweb/raw/instalar/verifatt.sh > /dev/null 2>&1
wget https://github.com/cloudnetbr/pweb/raw/instalar/verpweb > /dev/null 2>&1
wget https://github.com/cloudnetbr/pweb/raw/instalar/verweb > /dev/null 2>&1
verp=$(sed -n '1 p' /bin/ppweb/verpweb| sed -e 's/[^0-9]//ig') &>/dev/null
verw=$(sed -n '1 p' /bin/ppweb/verweb| sed -e 's/[^0-9]//ig') &>/dev/null
echo -e "$verp" >/bin/ppweb/attpweb
echo -e "$verw" >/bin/ppweb/attweb
chmod 777 *.sh > /dev/null 2>&1
[[! -e /etc/autostart ]] && {
	echo '#!/bin/bash
Claro
#INICIO AUTOMATICO' >/etc/autostart
	chmod +x /etc/autostart
}
}
função inst_base {
  msg -bar
  echo -e "\e[1;97m \e[5m\033[1;100m SERVIDOR PHP e MYSQL \033[1;37m""
  msg -bar
  print_center -ama "Este processo pode demorar um pouco!\n"
  msg -bar3
    echo -e "\n\033[1;36mINSTALANDO O APACHE2 \033[1;33mAGUARDE...\033[0m"
apt install apache2 -y > /dev/null 2>&1
apt install dirmngr apt-transport-https -y > /dev/null 2>&1
apt install php7.3 libapache2-mod-php7.3 php7.3-xml php7.3-mcrypt php7.3-curl php7.3-mbstring php7.3-cli -y > /dev/null 2>&1
systemctl reinicie o apache2 > /dev/null 2>&1
apt-get install mariadb-server -y > /dev/null 2>&1
cd || saída
echo -e "\n\033[1;36mINSTALANDO O MySQL \033[1;33mAGUARDE...\033[0m"
mysqladmin -u senha do root "$pwdroot" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "UPDATE mysql.user SET Password=PASSWORD('$pwdroot') WHERE User='root'" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "FLUSH PRIVILEGES" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "DELETE FROM mysql.user WHERE User=''" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "FLUSH PRIVILEGES" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "CREATE DATABASE sshplus;" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "GRANTA TODOS OS PRIVILÉGIOS NO sshplus.* Para 'root'@'localhost' IDENTIFICADO POR '$pwdroot';" > /dev/null 2>&1
mysql -u root -p"$pwdroot" -e "FLUSH PRIVILEGES" > /dev/null 2>&1
echo '[mysqld]
max_connections = 10000' >> /etc/mysql/my.cnf
apt install php7.3-mysql -y > /dev/null 2>&1
phpenmod mcrypt > /dev/null 2>&1
systemctl reinicie o apache2 > /dev/null 2>&1
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin > /dev/null 2>&1
apt install php7.3-ssh2 -y > /dev/null 2>&1
php -m | grep ssh2 > /dev/null 2>&1
curl -sS getcomposer.org/installer | php > /dev/null 2>&1
mv composer.phar /usr/local/bin/composer > /dev/null 2>&1
chmod +x /usr/local/bin/composer > /dev/null 2>&1
cd /var/www/html || saída
wget https://github.com/cloudnetbr/pweb/raw/instalar/gestorssh.zip > /dev/null 2>&1
apt-get install unzip > /dev/null 2>&1
descompacte o gerenciadorssh.zip > /dev/null 2>&1
(eco sim; eco sim; eco sim; eco sim) | instalação do compositor > /dev/null 2>&1
(eco sim; eco sim; eco sim; eco sim) | compositor requer phpseclib/phpseclib:~2.0 > /dev/null 2>&1
ln -s /usr/share/phpmyadmin/ /var/www/html > /dev/null 2>&1
chmod 777 -R /var/www/html > /dev/null 2>&1
rm gestorssh.zip index.html > /dev/null 2>&1
systemctl reiniciar mysql
Claro
}
função phpmadm {
cd /usr/share || saída
wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.zip > /dev/null 2>&1
descompacte phpMyAdmin-5.2.0-all-languages.zip > /dev/null 2>&1
mv phpMyAdmin-5.2.0-todos os idiomas phpmyadmin > /dev/null 2>&1
chmod -R 0777 phpmyadmin > /dev/null 2>&1
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin > /dev/null 2>&1
systemctl reinicie o apache2 > /dev/null 2>&1
rm phpMyAdmin-5.2.0-all-languages.zip > /dev/null 2>&1
cd /raiz || saída
}

função pconf {
sed "s/1020/$pwdroot/" /var/www/html/pages/system/pass.php > /tmp/pass
mv /tmp/pass /var/www/html/pages/system/pass.php

}
função inst_db {
dormir 1
if [[ -e "/var/www/html/bdgestorssh.sql" ]]; então
    mysql -h localhost -u root -p"$pwdroot" --default_character_set utf8 sshplus < /var/www/html/bdgestorssh.sql > /dev/null 2>&1
    rm /var/www/html/bdgestorssh.sql > /dev/null 2>&1
senão
    Claro
    echo -e "\033[1;31m ERRO CRÍTICO\033[0m"
    dormir 2
    systemctl reinicie o apache2 > /dev/null 2>&1
cat /dev/null > ~/.bash_history && history -c
rm /bin/ubuinst* > /dev/null 2>&1
Claro
saída;
fi
Claro
}
função cron_set {
crontab -l > cronset > /dev/null 2>&1
eco "
@reboot /etc/autostart
* * * * * /etc/autostart
0 */12 * * * cd /var/www/html/pages/system/ && bash cron.backup.sh && cd /root
5 */3 * * * cd /var/www/html/pages/system/ && /usr/bin/php cron.backup.php && cd /root
* * * * * cd /var/www/html/pages/system/ && bash cron.userteste.sh && cd /root
2 */3 * * * cd /var/www/html/pages/system/ && bash cron.autobackup.sh && cd /root
* * * * * /usr/bin/php /var/www/html/pages/system/cron.online.ssh.php
@daily /usr/bin/php /var/www/html/pages/system/cron.rev.php
* * * * * /usr/bin/php /var/www/html/pages/system/cron.ssh.php
* * * * * /usr/bin/php /var/www/html/pages/system/cron.php
*/30 * * * * /usr/bin/php /var/www/html/pages/system/hist.online.php" > cronset
crontab cronset && rm cronset > /dev/null 2>&1
}
função fun_swap {
			swapoff -a
            rm -rf /bin/ram.img > /dev/null 2>&1
            fallocate -l 4G /bin/ram.img > /dev/null 2>&1
            chmod 600 /bin/ram.img > /dev/null 2>&1
            mkswap /bin/ram.img > /dev/null 2>&1
            swapon /bin/ram.img > /dev/null 2>&1
            echo 50 > /proc/sys/vm/swappiness
            echo '/bin/ram.img nenhum swap sw 0 0' | tee -a /etc/fstab > /dev/null 2>&1
            dormir 2
}
função tst_bkp {
cd || saída
sed -i "s;1020;$pwdroot;g" /var/www/html/lib/Database/Connection.php > /dev/null 2>&1
sed -i "s;49875103u;$pwdroot;g" /var/www/html/pages/system/config.php > /dev/null 2>&1
sed -i "s;localhost;$IP;g" /var/www/html/pages/system/config.php > /dev/null 2>&1
}
Claro
install_start
IP=$(wget -qO- ipv4.icanhazip.com)
echo "America/Sao_Paulo" > /etc/timezone > /dev/null 2>&1
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime > /dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
Claro
echo -e "\E[44;1;37m INSTALANDO PAINEL \E[0m"
eco ""
echo -e "PAINEL WEB CLOUDTECH" | figo
echo -e "\033[1;37m ❌ INSTALAÇÃO BLOQUEADA PELO DESENVOLVEDOR!\033[38;5;197m\033[38;5;197m\033[1;37m""
echo -e "\033[1;37m 🔑 USE A CHAVE ADQUIRIDA PARA CONCLUIR!\033[38;5;197m\033[38;5;197m\033[1;37m] "
eco ""
chave=$(curl -sSL "raw.githubusercontent.com/cloudnetbr/pweb/instalar/chave") &>/dev/null

leia -p "DIGITE A CHAVE DE INSTALAÇÃO: " tecla
    
         if [[ "$chave" = "$chave" ]]
          então
               echo -e "[*] VALIDANDO A CHAVE DE INSTALAÇÃO"
                dormir 2
                echo $chave > /bin/chave_inst
                echo -e "[*] CHAVE ACEITA"
                dormir 2
            senão
            echo "[-] ESSA CHAVE NÃO É VÁLIDA!"
            dormir 3
            Claro
            cat /dev/null > ~/.bash_history && history -c
            rm /bin/ubuinst* > /dev/null 2>&1
            saída;
          fi
instalar_continuar
install_continue2
[[ $(grep -c "prohibit-password" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/prohibit-password/yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "sem senha" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/sem senha/sim/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "#PermitRootLogin" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/#PermitRootLogin/PermitRootLogin/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "PasswordAuthentication" /etc/ssh/sshd_config) = '0' ]] && {
	echo 'PasswordAuthentication yes' > /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null
[[ $(grep -c "#PasswordAuthentication no" /etc/ssh/sshd_config) != '0' ]] && {
	sed -i "s/#PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
} > /dev/null
eco ""
echo -e "PAINEL WEB CLOUDTECH" | figo
echo -e " \033[1;31mPor @CLODTECH MT\033[1;36m"
eco ""
echo -e "\033[1;36mDEFINA UMA NOVA SENHA PARA\033[0m"
echo -e "\033[1;36mO USUÁRIO ROOT DA VPS E\033[0m"
echo -e "\033[1;36mPARA O USUÁRIO DO PHPMYADMIN!\033[0m"
eco ""
leia -p "DIGITE UMA NOVA SENHA ROOT: " pwdroot
echo "root:$pwdroot" | chpasswd
echo -e "\n\033[1;36mINICIANDO INSTALAÇÃO \033[1;33mAGUARDE..."
dormir 3
Claro
base_inst
phpmadm
pconf
inst_db
cron_set
fun_swap
tst_bkp
Claro
sed -i "s;upload_max_filesize = 2M;upload_max_filesize = 256M;g" /etc/php/7.3/apache2/php.ini > /dev/null 2>&1
sed -i "s;post_max_size = 8M;post_max_size = 256M;g" /etc/php/7.3/apache2/php.ini > /dev/null 2>&1
echo -e "PAINEL WEB CLOUDTECH" | figo
echo -e " \033[1;31mPor @clodtechmt\033[1;36m"
eco ""
echo -e "\033[1;32mPAINEL INSTALADO COM SUCESSO!"
eco ""
echo -e "\033[1;36m SEU PAINEL:\033[1;37m http://$IP/admin\033[0m"
echo -e "\033[1;36m USUÁRIO:\033[1;37m admin\033[0m"
echo -e "\033[1;36m SENHA:\033[1;37m admin\033[0m"
eco ""
echo -e "\033[1;36m LOJA DE APPS:\033[1;37m http://$IP/apps\033[0m"
eco ""
echo -e "\033[1;36m PHPMYADMIN:\033[1;37m http://$IP/phpmyadmin\033[0m"
echo -e "\033[1;36m USUÁRIO:\033[1;37m root\033[0m"
echo -e "\033[1;36m SENHA:\033[1;37m $pwdroot\033[0m"
eco ""
echo -e "\033[1;31m \033[1;33mCOMANDO PRINCIPAL: \033[1;32mpainel\033[0m""
echo -e "\033[1;33m MAIS INFORMAÇÕES \033[1;31m(\033[1;36mTELEGRAM\033[1;31m): \033[1;37m@clodtechmt\033[0m""
eco ""
echo -ne "\n\033[1;31mENTER \033[1;33mpara retornar...\033[1;32m! \033[0m""; ler
systemctl reinicie o apache2 > /dev/null 2>&1
systemctl reinicie o mysql > /dev/null 2>&1
cat /dev/null > ~/.bash_history && history -c
rm /bin/ubuinst* > /dev/null 2>&1
Claro