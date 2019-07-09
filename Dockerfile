FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build-env
WORKDIR /app

COPY . ./
RUN dotnet publish -c Release

FROM nginx

WORKDIR /var/www/web
COPY --from=build-env /app/bin/Release/netstandard2.0/publish/ToDoList/dist .
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80