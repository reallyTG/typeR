library(aws.iam)


### Name: create_key
### Title: Manage Access Keys/Credentials
### Aliases: create_key update_key delete_key list_keys

### ** Examples

## Not run: 
##D # list access keys
##D list_keys()
##D 
##D # create a user key
##D u <- create_user("example-user")
##D str(k <- create_key(u))
##D 
##D # toggle key status to inactive
##D update_key(k, u, "Inactive")
##D list_keys(u)
##D 
##D # cleanup
##D delete_key(k)
##D delete_user(u)
## End(Not run)



