library(aws.s3)


### Name: get_encryption
### Title: Bucket encryption
### Aliases: get_encryption put_encryption delete_encryption

### ** Examples

## Not run: 
##D  # example bucket
##D  put_bucket("mybucket")
##D 
##D  # set and check encryption
##D  put_encryption("mybucket", "AES256")
##D  get_encryption("mybucket")
##D 
##D  # delete encryption
##D  delete_encryption("mybucket")
## End(Not run)




