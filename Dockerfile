# Use a Python base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /data

# Copy requirements.txt and install dependencies
COPY requirements.txt .  
RUN pip install --no-cache-dir -r requirements.txt  

# Copy all project files
COPY . .  

# Run database migrations
RUN python manage.py migrate  

# Expose Django's default port
EXPOSE 8000  

# Start the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



