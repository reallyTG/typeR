library(googleCloudStorageR)


### Name: gcs_signed_url
### Title: Create a signed URL
### Aliases: gcs_signed_url

### ** Examples


## Not run: 
##D 
##D obj <- gcs_get_object("your_file", meta = TRUE)
##D 
##D signed <- gcs_signed_url(obj)
##D 
##D temp <- tempfile()
##D on.exit(unlink(temp))
##D 
##D download.file(signed, destfile = temp)
##D file.exists(temp)
##D 
## End(Not run)




