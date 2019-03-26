library(aws.lambda)


### Name: create_function
### Title: Manage AWS Lambda Functions
### Aliases: create_function update_function make_function_version

### ** Examples

## Not run: 
##D   # 'hello world!' example code
##D   hello <- system.file("templates", "helloworld.js", package = "aws.lambda")
##D 
##D   # get IAM role for Lambda execution
##D   library("aws.iam")
##D   id <- get_caller_identity()[["Account"]]
##D   role <- paste0("arn:aws:iam::", id, ":role/lambda_basic_execution")
##D 
##D   func <- create_function("helloworld", func = hello, 
##D                           handler = "helloworld.handler", 
##D                           role = role)
##D   
##D   # invoke function
##D   invoke_function(func)
##D 
##D   # delete function
##D   delete_function(func)
## End(Not run)



