library(etseed)


### Name: auth
### Title: etcd authentication - auth control
### Aliases: auth auth_disable auth_enable auth_status

### ** Examples

## Not run: 
##D # make a client
##D cli <- etcd()
##D 
##D # check authentication status
##D cli$auth_status()
##D 
##D # enable authentication
##D cli$auth_enable("root", "pickbetterpwd")
##D 
##D # woops, if you got error about root user, craeate one first
##D cli$user_add(user = "root", password = "pickbetterpwd")
##D 
##D # disable authentication
##D cli$auth_disable("root", "pickbetterpwd")
##D 
##D # check again, now disabled
##D cli$auth_status()
##D 
##D # Users
##D # Add user
##D cli$user_add("jane", "janepwd", "root", "pickbetterpwd")
##D # List users
##D cli$user_list()
##D # Get a single user
##D cli$user_get("root")
##D cli$user_get("jane")
##D # Delete user
##D cli$user_delete("jane", "root", "pickbetterpwd")
## End(Not run)



