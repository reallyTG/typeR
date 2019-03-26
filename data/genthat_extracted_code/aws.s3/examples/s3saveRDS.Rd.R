library(aws.s3)


### Name: s3saveRDS
### Title: saveRDS/readRDS
### Aliases: s3saveRDS s3readRDS

### ** Examples

## Not run: 
##D # create bucket
##D b <- put_bucket("myexamplebucket")
##D 
##D # save a single object to s3
##D s3saveRDS(x = mtcars, bucket = "myexamplebucket", object = "mtcars.rds")
##D 
##D # restore it under a different name
##D mtcars2 <- s3readRDS(object = "mtcars.rds", bucket = "myexamplebucket")
##D identical(mtcars, mtcars2)
##D 
##D # cleanup
##D delete_object(object = "mtcars.rds", bucket = "myexamplebucket")
##D delete_bucket("myexamplebucket")
## End(Not run)



