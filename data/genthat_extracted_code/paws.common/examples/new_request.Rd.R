library(paws.common)


### Name: new_request
### Title: Return an API request object
### Aliases: new_request

### ** Examples

# Make a request object for the S3 ListBuckets operation.
## No test: 
client <- function() {new_service(metadata, handlers)}
op <- new_operation("ListBuckets", "GET", "/", list())
params <- list()
data <- tag_add(list(Buckets = list()), list(type = "structure"))
req <- new_request(client, op, params, data)
## End(No test)




