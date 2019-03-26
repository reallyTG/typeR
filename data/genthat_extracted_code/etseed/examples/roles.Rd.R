library(etseed)


### Name: roles
### Title: etcd authentication - roles
### Aliases: role_add role_delete role_get role_list roles

### ** Examples

## Not run: 
##D # make a client
##D cli <- etcd()
##D 
##D # Add role
##D #perms <- list(fun = list(kv = list(read = "/message/*")))
##D #cli$role_add(role = "fun", perm_read = perms, auth_user="root",
##D #  auth_pwd="pickbetterpwd")
##D 
##D # List roles
##D cli$role_list()
##D 
##D # Get a single role
##D cli$role_get("root")
##D cli$role_get("fun")
##D 
##D # Delete role
##D cli$role_delete("fun", "root", "pickbetterpwd")
##D 
##D # Update a role
##D ### FIXME - still working on this
##D ## First, create
##D # cli$role_add("stuff", perm_read = "/message/*", perm_write = "/message/*",
##D #    auth_user = "root", auth_pwd = "pickbetterpwd")
##D ## udpate
##D # "xxx"
##D ## get
##D # cli$role_get("stuff")
## End(Not run)



