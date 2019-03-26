library(aws.cloudtrail)


### Name: create_trail
### Title: Trails
### Aliases: create_trail update_trail delete_trail

### ** Examples

## Not run: 
##D   require("aws.s3")
##D   # create a bucket
##D   mybucket <- "mycloudtrailbucket"
##D   stopifnot(put_bucket(mybucket))
##D   # set bucket policy for CloudTrail
##D   ctpolicy <- cloudtrail_s3policy(mybucket, "my_aws_id")
##D   stopifnot(put_bucket_policy(mybucket, policy = ctpolicy))
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



