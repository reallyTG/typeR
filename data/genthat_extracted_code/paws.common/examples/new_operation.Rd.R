library(paws.common)


### Name: new_operation
### Title: Return an API operation object
### Aliases: new_operation

### ** Examples

# Save info about the S3 ListBuckets API operation.
op <- new_operation(
  name = "ListBuckets",
  http_method = "GET",
  http_path = "/",
  paginator = list()
)




