library(etseed)


### Name: members
### Title: Manage etcd members
### Aliases: member_add member_change member_delete member_list members

### ** Examples

## Not run: 
##D Sys.setenv(ETSEED_USER = "root")
##D Sys.setenv(ETSEED_PWD = "pickbetterpwd")
##D 
##D # make a client
##D cli <- etcd()
##D 
##D # list members
##D cli$member_list()
##D 
##D # add a member
##D # cli$member_add("http://10.0.0.10:2380")
##D 
##D # change a member - not sure this is working...
##D ## mms <- cli$member_list()
##D ## cli$member_change(mms$members[[1]]$id, "http://10.0.0.10:8380", config=verbose())
##D 
##D # delete a member
##D # mms <- cli$member_list()
##D # cli$member_delete(mms$members[[1]]$id)
## End(Not run)



