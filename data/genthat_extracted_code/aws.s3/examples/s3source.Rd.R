library(aws.s3)


### Name: s3source
### Title: Source from S3
### Aliases: s3source

### ** Examples

## Not run: 
##D # create bucket
##D b <- put_bucket("myexamplebucket")
##D 
##D # save some code to the bucket
##D cat("x <- 'hello world!'\nx", file = "example.R")
##D put_object("example.R", object = "example.R", bucket = b)
##D get_bucket(b)
##D 
##D # source the code from the bucket
##D s3source(object = "example.R", bucket = b, echo = TRUE)
##D 
##D # cleanup
##D unlink("example.R")
##D delete_object(object = "example.R", bucket = b)
##D delete_bucket("myexamplebucket")
## End(Not run)



