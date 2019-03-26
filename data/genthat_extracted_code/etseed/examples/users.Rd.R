library(etseed)


### Name: users
### Title: etcd authentication - users
### Aliases: user_add user_delete user_get user_list users

### ** Examples

## Not run: 
##D # make a client
##D cli <- etcd()
##D 
##D # Add user
##D cli$user_add("jane", "janepwd", "root", "pickbetterpwd")
##D 
##D # List users
##D cli$user_list()
##D 
##D # Get a single user
##D cli$user_get("root")
##D cli$user_get("jane")
##D 
##D # Delete user
##D cli$user_delete("jane", "root", "pickbetterpwd")
## End(Not run)



