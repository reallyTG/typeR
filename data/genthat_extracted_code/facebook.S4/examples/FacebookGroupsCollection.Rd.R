library(facebook.S4)


### Name: FacebookGroupsCollection
### Title: Build a collection of Facebook groups
### Aliases: FacebookGroupsCollection

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D  load("fb_oauth")
##D  
##D ## Pull at most 10 groups from the current user
##D  fb.groups <- FacebookUsersCollection("me", fb_oauth) %>% FacebookGroupscollection(n = 10)
##D 
##D ## Get the members of these groups
##D  fb.members <- FacebookUsersCollection(fb.groups)
##D  
##D ## Convert the collection to a data frame
##D fb.groups.df <- as.data.frame(fb.groups)
##D 
## End(Not run)




