# Use uma imagem Node.js como base
FROM node:18-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo package.json e o package-lock.json (se disponível) para o diretório de trabalho
COPY package.json package-lock.json ./

# Instale as dependências do projeto
RUN npm install

# Copie o diretório prisma e os outros arquivos para o diretório de trabalho
COPY prisma ./prisma
COPY . .

# Exponha a porta 3000 para o mundo exterior
EXPOSE 3000

# sh é um shell Unix que é comum em sistemas Unix-like, como o Alpine Linux
# -c é uma opção que diz ao shell para executar o comando que segue

# Execute o aplicativo quando o contêiner for iniciado
CMD ["sh", "-c", "npx prisma migrate dev --name init --schema=./prisma/schema.prisma && npm run dev"]

