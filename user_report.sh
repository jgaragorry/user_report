#!/bin/bash

##########################################################
# Script: user_stats.sh
# Descripción: Este script muestra estadísticas sobre los usuarios del sistema.
# Autor: Jose Garagorry <jj@softraincorp.com>
##########################################################

# Contar la cantidad total de usuarios en el sistema
total_users=$(cat /etc/passwd | wc -l)

# Contar cuántos son usuarios root
root_users=$(grep "^root:" /etc/passwd | wc -l)

# Contar cuántos son usuarios finales (no root)
end_users=$(expr $total_users - $root_users)

# Listar usuarios con acceso a shell y su tipo de shell
shell_users=$(cat /etc/passwd | grep -E "/(sh|ksh|csh|bash)$" | awk -F: '{print $1 " - " $7}')

# Contar cuántos usuarios pueden hacer login
login_users=$(echo "$shell_users" | wc -l)

# Mostrar salida formateada
echo -e "\e[1;32mCantidad total de usuarios en el sistema:\e[0m $total_users"
echo -e "\e[1;32mCantidad de usuarios con permisos de root:\e[0m $root_users"
echo -e "\e[1;32mCantidad de usuarios finales (no root):\e[0m $end_users"
echo -e "\e[1;32mUsuarios con acceso a shell y tipo de shell:\e[0m"
echo "$shell_users"
echo -e "\e[1;32mCantidad de usuarios que pueden hacer login:\e[0m $login_users"

