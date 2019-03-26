library(aws.s3)


### Name: get_object
### Title: Get object
### Aliases: get_object save_object head_object

### ** Examples

## Not run: 
##D   # get an object in memory
##D   ## create bucket
##D   b <- put_bucket("myexamplebucket")
##D   
##D   ## save a dataset to the bucket
##D   s3save(mtcars, bucket = b, object = "mtcars")
##D   obj <- get_bucket(b)
##D   ## get the object in memory
##D   x <- get_object(obj[[1]])
##D   load(rawConnection(x))
##D   "mtcars" %in% ls()
##D 
##D   # save an object locally
##D   y <- save_object(obj[[1]], file = object[[1]][["Key"]])
##D   y %in% dir()
##D 
##D   # return object using 'S3 URI' syntax
##D   get_object("s3://myexamplebucket/mtcars")
##D 
##D   # return parts of an object
##D   ## use 'Range' header to specify bytes
##D   get_object(object = obj[[1]], headers = list('Range' = 'bytes=1-120'))
## End(Not run)



