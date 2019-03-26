library(aws.kms)


### Name: enable_kms_rotation
### Title: Enable/Disable Key Rotation
### Aliases: enable_kms_rotation disable_kms_rotation get_kms_rotation

### ** Examples

## Not run: 
##D   # create key
##D   k <- create_kms_key(description = "example")
##D   
##D   # enable rotation
##D   enable_kms_rotation(k)
##D   
##D   # disable rotation
##D   disable_kms_rotation(k)
##D   
##D   # confirm rotation is disabled
##D   get_kms_rotation(k)
##D   
##D   # delete in 7 days
##D   delete_kms_key(k)
## End(Not run)



