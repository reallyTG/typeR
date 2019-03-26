library(aws.s3)


### Name: get_bucket
### Title: List bucket contents
### Aliases: get_bucket get_bucket_df

### ** Examples

## Not run: 
##D   # basic usage
##D   b <- bucketlist()
##D   get_bucket(b[1,1])
##D   get_bucket_df(b[1,1])
##D 
##D   # bucket names with dots
##D   ## this (default) should work:
##D   get_bucket("this.bucket.has.dots", url_style = "path")
##D   ## this probably wont:
##D   #get_bucket("this.bucket.has.dots", url_style = "virtual")
## End(Not run)




