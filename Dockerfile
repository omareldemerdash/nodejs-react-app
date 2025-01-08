# Use official Node.js image from the Docker Hub as the base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or npm-shrinkwrap.json) for installing dependencies
COPY package*.json ./

# Install the dependencies for the Node.js backend
RUN npm install

# Copy the rest of the application files
COPY . .
# build for react 
RUN npm run build

# Switch back to the root directory
WORKDIR /app

# Expose the application port (for both frontend and backend)
EXPOSE 3000

# Run the application
CMD ["npm", "start"]

