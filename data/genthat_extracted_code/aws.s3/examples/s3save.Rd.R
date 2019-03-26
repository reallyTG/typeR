library(aws.s3)


### Name: s3save
### Title: save/load
### Aliases: s3save s3save_image s3load

### ** Examples

## Not run: 
##D # create bucket
##D b <- put_bucket("myexamplebucket")
##D 
##D # save a dataset to the bucket
##D s3save(mtcars, iris, object = "somedata.Rdata", bucket = b)
##D get_bucket(b)
##D 
##D # load the data from bucket
##D e <- new.env()
##D s3load(object = "somedata.Rdata", bucket = b, envir = e)
##D ls(e)
##D 
##D # cleanup
##D rm(e)
##D delete_object(object = "somedata.Rdata", bucket = "myexamplebucket")
##D delete_bucket("myexamplebucket")
## End(Not run)



