library(rtweet)


### Name: suggested_slugs
### Title: Get user [account] suggestions for authenticating user
### Aliases: suggested_slugs suggested_users

### ** Examples


## Not run: 
##D 
##D ## get slugs
##D slugs <- suggested_slugs()
##D 
##D ## use slugs to get suggested users
##D suggested_users(slugs$slug[1])
##D 
##D ## alternatively, get all users from all slugs in one function
##D sugs <- all_suggested_users()
##D 
##D ## print data
##D sugs
##D 
##D ## for complete users data, lookup user IDs
##D sugs_usr <- lookup_users(sugs$user_id)
##D 
##D ## view users data
##D sugs_usr
##D 
## End(Not run)




