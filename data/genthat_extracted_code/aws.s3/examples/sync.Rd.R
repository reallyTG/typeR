library(aws.s3)


### Name: s3sync
### Title: S3 file sync
### Aliases: s3sync

### ** Examples

## Not run: 
##D   put_bucket("examplebucket")
##D 
##D   # sync all files in current directory to bucket (upload-only)
##D   s3sync(bucket = "examplebucket", direction = "upload")
##D 
##D   # two-way sync
##D   s3sync(bucket = "examplebucket")
## End(Not run)




