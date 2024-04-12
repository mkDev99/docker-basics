FROM alpine:latest

# Install nginx

RUN apk update && \
    apk add nginx \
    rm -rf /var/cache/apk/*

# Copy nginx configuration
COPY nginx.conf /etc/nginx/http.d/default.conf

# Create a directory for the website
RUN mkdir -p /var/www/html

# Copy the website
COPY index.html /var/www/html/index.html

# Change ownership of the website
RUN chown -R nginx:nginx /var/www/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD [ "nginx", "-g", "daemon off;"]