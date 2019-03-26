library(memoise)


### Name: cache_s3
### Title: Amazon Web Services S3 Cache Amazon Web Services S3 backed
###   cache, for remote caching.
### Aliases: cache_s3

### ** Examples


## Not run: 
##D # Set AWS credentials.
##D Sys.setenv("AWS_ACCESS_KEY_ID" = "<access key>",
##D            "AWS_SECRET_ACCESS_KEY" = "<access secret>")
##D 
##D # Set up a unique bucket name.
##D s3 <- cache_s3("unique-bucket-name")
##D mem_runif <- memoise(runif, cache = s3)
## End(Not run)





