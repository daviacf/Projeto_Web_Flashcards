#!/bin/bash

# 1. Valida se o Docker ou Podman estão instalados e rodando
if docker info > /dev/null 2>&1; then
    COMPOSE_CMD="docker-compose"
    echo "✅ Docker detectado e rodando!"
elif podman info > /dev/null 2>&1; then
    COMPOSE_CMD="podman-compose"
    echo "✅ Podman detectado e rodando!"
else
    echo "❌ Erro: Nem o Docker nem o Podman estão rodando. Inicie o daemon e tente novamente."
    exit 1
fi

echo "Iniciando o ambiente..."

# 2. Sobe o ambiente
$COMPOSE_CMD up -d

echo ""
echo "Status dos processos:"

# 3. Exibe o status dos containers
$COMPOSE_CMD ps