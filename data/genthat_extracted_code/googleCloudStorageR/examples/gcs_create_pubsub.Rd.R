library(googleCloudStorageR)


### Name: gcs_create_pubsub
### Title: Create a pub/sub notification for a bucket
### Aliases: gcs_create_pubsub

### ** Examples


## Not run: 
##D 
##D project <- "myproject"
##D bucket <- "mybucket"
##D 
##D # get the email to give access
##D gce_get_service_email(project)
##D 
##D # once email has access, create a new pub/sub topic for your bucket
##D gcs_create_pubsub("gcs_r", project, bucket)
##D 
## End(Not run)





