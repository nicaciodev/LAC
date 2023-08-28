#!/bin/bash


#---[ Levantando a composição ]--------------------------------------------------------
docker-compose up -d ;\


#---[ Obtendo os IPs ]-----------------------------------------------------------------
ipserv01=$(docker exec serv01 ip a |grep -i inet |egrep -v 'inet6|127.0' |awk '{print $2}' |awk -F "/" '{print $1}') ;\
ipserv02=$(docker exec serv02 ip a |grep -i inet |egrep -v 'inet6|127.0' |awk '{print $2}' |awk -F "/" '{print $1}') ;\
ipserv03=$(docker exec serv03 ip a |grep -i inet |egrep -v 'inet6|127.0' |awk '{print $2}' |awk -F "/" '{print $1}') ;\


#---[ Limpando os ips ]-------------------------------------------------------------------
ssh-keygen -f ~/.ssh/known_hosts -R $ipserv01 ;\
ssh-keygen -f ~/.ssh/known_hosts -R $ipserv02 ;\
ssh-keygen -f ~/.ssh/known_hosts -R $ipserv03 ;\


#---[ Instruções ]------------------------------------------------------------------------
echo "\
===[ Instruções ]====================================================================== 

    Esta é uma demontração de um sistema de controle de login para servidores linux,
baseado em código livre.
    Para acessar o gerenciador [LAC], acesse em seu navegador:
<localhost:2080>.

    Para testar, acesse um dos servidores de teste por este terminal, 
e tente logar com um dos usuários listados no [Gerenciador LAC] <localhost:2080>.
    Segue abaixo a lista dos servidores para testes de login:
    
    serv01 = $ipserv01
    serv02 = $ipserv02
    serv03 = $ipserv03
    
    Por exemplo: ssh teste01@$ipserv01
    Inicialmente todas as senhas são: [ok]
    
    Por fim, para finalizar esta demonstração do [LAC], execute:
    docker-compose down
    
    Obrigado por testar!
    
    Autores:
    Robson Nicácio: <https://www.linkedin.com/in/robson-nicacio/>.
    Paulo Rolney: <https://www.linkedin.com/in/paulo-rolney/>.
    
----------------------------------------------------------------------------------------    
"
