# Use a base image
FROM nginx:1.22.1

# Copy the contents of the local 'webapp' directory into the NGINX HTML directory
COPY ./webapp /usr/share/nginx/html

# Expose port 80 to allow traffic to reach the NGINX container
EXPOSE 80

# Configure a health check to ensure the container is healthy
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1

# Start the NGINX server
CMD ["nginx", "-g", "daemon off;"]
