library(aws.s3)


### Name: put_object
### Title: Put object
### Aliases: put_object put_folder

### ** Examples

## Not run: 
##D   library("datasets")
##D   
##D   # write file to S3
##D   tmp <- tempfile()
##D   on.exit(unlink(tmp))
##D   utils::write.csv(mtcars, file = tmp)
##D   put_object(tmp, object = "mtcars.csv", bucket = "myexamplebucket")
##D 
##D   # create a "folder" in a bucket
##D   put_folder("example", bucket = "myexamplebucket")
##D   ## write object to the "folder"
##D   put_object(tmp, object = "example/mtcars.csv", bucket = "myexamplebucket")
##D 
##D   # write serialized, in-memory object to S3
##D   x <- rawConnection(raw(0), "w")
##D   utils::write.csv(mtcars, x)
##D   put_object(rawConnectionValue(x), object = "mtcars.csv", bucket = "myexamplebucketname")
##D 
##D   # use `headers` for server-side encryption
##D   ## require appropriate bucket policy
##D   ## encryption can also be set at the bucket-level using \code{put_encryption}
##D   put_object(file = tmp, object = "mtcars.csv", bucket = "myexamplebucket",
##D              headers = c('x-amz-server-side-encryption' = 'AES256'))
##D 
##D   # alternative "S3 URI" syntax:
##D   put_object(rawConnectionValue(x), object = "s3://myexamplebucketname/mtcars.csv")
##D   close(x)
##D 
##D   # read the object back from S3
##D   read.csv(text = rawToChar(get_object(object = "s3://myexamplebucketname/mtcars.csv")))
## End(Not run)



