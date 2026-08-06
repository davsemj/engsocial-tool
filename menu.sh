#!/bin/bash


if [ "$EUID" -ne 0 ]; then
  echo -e "\e[1;31m[!] Erro: Este toolkit precisa ser executado como ROOT no Kali Linux.\e[0m"
  echo -e "Use: \e[1;32msudo ./menu.sh\e[0m"
  exit 1
fi

exibir_menu() {
    clear
   
    echo -e "\e[1;31m"
    echo "====================================================="
    echo "                ENGSOCIAL TOOL v1.0                  "
    echo "====================================================="
    echo -e "\e[0m"

    
    echo -e "\e[1;34m"
    echo " [01] ZPhisher               [02] SEToolkit"
    echo " [03] Metasploit             [04] IP Info"
    echo " [05] Sair"
    echo -e "\e[0m"
    echo "-----------------------------------------------------"
}

while true; do
    exibir_menu
    echo -n "Escolha uma opção: "
    read opcao

    case $opcao in
        1|01)
            echo -e "\n\e[1;33m[*] Verificando ZPhisher...\e[0m"
            if [ ! -d "zphisher" ]; then
                echo -e "\e[1;31m[!] Clonando ZPhisher para a pasta local...\e[0m"
                git clone --depth=1 https://github.com/htr-tech/zphisher.git
            fi
            echo -e "\n\e[1;32m[+] Iniciando ZPhisher...\e[0m"
            cd zphisher
            bash zphisher.sh
            cd ..
            echo -e "\nPressione [ENTER] para voltar ao menu."
            read
            ;;
            
        2|02)
            echo -e "\n\e[1;32m[+] Iniciando Social-Engineer Toolkit (SET)...\e[0m"
            setoolkit
            echo -e "\nPressione [ENTER] para voltar ao menu."
            read
            ;;

        3|03)
            echo -e "\n\e[1;32m[+] Iniciando Metasploit Framework Console...\e[0m"
            msfconsole
            echo -e "\nPressione [ENTER] para voltar ao menu."
            read
            ;;

        4|04)
            echo -e "\n\e[1;32m[+] Obtendo Informações de IP...\e[0m"
            echo -n "Digite o IP (ou deixe em branco para o seu): "
            read alvo_ip
            echo -e "\n\e[1;33m[*] Consultando dados API...\e[0m\n"
            curl -s "https://ipapi.co{alvo_ip}/yaml"
            echo -e "\nPressione [ENTER] para voltar ao menu."
            read
            ;;

        5|05)
            echo -e "\nSaindo do Engsocial Tool... Até logo!"
            exit 0
            ;;
            
        *)
            echo -e "\n\e[1;31m[!] Opção inválida!\e[0m"
            sleep 1.2
            ;;
    esac
done
