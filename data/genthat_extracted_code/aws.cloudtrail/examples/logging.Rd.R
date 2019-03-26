library(aws.cloudtrail)


### Name: start_logging
### Title: logging
### Aliases: start_logging stop_logging

### ** Examples

## Not run: 
##D   require("aws.s3")
##D   # create a bucket
##D   mybucket <- "mybucket_for_cloudtrail"
##D   stopifnot(put_bucket(mybucket))
##D   
##D   # create a trail
##D   trail <- create_trail("exampletrail", mybucket)
##D   # confirm trail created
##D   get_trails()
##D 
##D   # start/stop logging to the trail
##D   start_logging(trail)
##D   stop_logging(trail)
##D   
##D   # check trail status
##D   trail_status(trail)
##D   
##D   # delete trail
##D   delete_trail(trail)
## End(Not run)



