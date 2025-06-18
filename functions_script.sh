#!/bin/bash

# This script demonstrates functions and arrays for automating AWS setup
# Purpose: Manage environment setup and AWS configuration checks

# Environment variable
ENVIRONMENT=$1
# Stores the first argument as the environment type

# Function to check the number of arguments
check_num_of_args() {
    # Checking the number of arguments
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

# Function to activate infrastructure environment
activate_infra_environment() {
    # Acting based on the argument value
    if [ "$ENVIRONMENT" == "local" ]; then
        echo "Running script for Local Environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
        echo "Running script for Testing Environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then
        echo "Running script for Production Environment..."
    else
        echo "Invalid environment specified. Please use 'local', 'testing', or 'production'."
        exit 2
    fi
}

# Function to check if AWS CLI is installed
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before proceeding."
        return 1
    fi
}

# Function to check if AWS profile is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile environment variable is not set."
        return 1
    fi
}

# Array of resources to set up
declare -a resources=("EC2" "S3")
# Defines an array of AWS resources to iterate over

# Function to set up AWS resources
setup_aws_resources() {
    for resource in "${resources[@]}"; do
        # Loops through each resource in the array
        echo "Setting up $resource for $ENVIRONMENT environment..."
        # Placeholder for actual resource creation (e.g., aws ec2 run-instances or aws s3api create-bucket)
    done
}

# Call all functions
check_num_of_args
activate_infra_environment
check_aws_cli
check_aws_profile
setup_aws_resources