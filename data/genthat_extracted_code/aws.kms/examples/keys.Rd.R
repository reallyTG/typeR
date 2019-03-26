library(aws.kms)


### Name: create_kms_key
### Title: Create/Update/Retrieve/Delete Encryption Key
### Aliases: create_kms_key update_kms_key get_kms_key delete_kms_key
###   undelete_kms_key

### ** Examples

## Not run: 
##D   # create key
##D   k <- create_kms_key(description = "example")
##D   
##D   # get key
##D   get_kms_key(k)
##D   
##D   # delete in 30 days
##D   delete_kms_key(k, delay = 30)
## End(Not run)



