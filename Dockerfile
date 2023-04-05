# Use the official Node.js 14 image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Set env variables
ENV NODE_ENV=development

# Install dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build the TypeScript files
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start the Next.js app
CMD ["npm", "start"]
