library(aws.s3)


### Name: s3write_using
### Title: Custom read and write
### Aliases: s3write_using s3read_using

### ** Examples

## Not run: 
##D library("datasets")
##D # create bucket
##D b <- put_bucket("myexamplebucket")
##D 
##D # save a dataset to the bucket as a csv
##D if (require("utils")) {
##D   s3write_using(mtcars, FUN = write.csv, object = "mtcars.csv", bucket = b)
##D }
##D 
##D # load dataset from the bucket as a csv
##D if (require("utils")) {
##D   s3read_using(FUN = read.csv, object = "mtcars.csv", bucket = b)
##D }
##D 
##D # cleanup
##D delete_object(object = "mtcars.csv", bucket = b)
##D delete_bucket(bucket = b)
## End(Not run)



