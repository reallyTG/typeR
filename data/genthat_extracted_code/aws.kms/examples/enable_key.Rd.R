library(aws.kms)


### Name: enable_kms_key
### Title: Enable/Disable Encryption Key
### Aliases: enable_kms_key disable_kms_key

### ** Examples

## Not run: 
##D   # create key
##D   k <- create_kms_key(description = "example")
##D   
##D   # disable key
##D   disable_kms_key(k)
##D   
##D   # enable key
##D   enable_kms_key(k)
##D   
##D   # delete in 7 days
##D   delete_kms_key(k)
## End(Not run)



