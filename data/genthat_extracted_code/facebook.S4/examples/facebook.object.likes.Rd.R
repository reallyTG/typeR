library(facebook.S4)


### Name: facebook.object.likes
### Title: Pull all the public likes of Facebook users or pages
### Aliases: facebook.object.likes

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D  load("fb_oauth")
##D  
##D ## Returns the id and the type of the current user's likes
##D  me.likes <- facebook.users.likes(id = "me", token = fb_oauth)
##D  
##D ## Do the same, but starting from a users collection
##D  me.likes <- FacebookUsersCollection(id="me", fb_oauth) %>% facebook.users.likes()
##D  
##D ## Build a pages collection from all the pages (and ONLY the pages)
##D ## the current user likes
##D  me.likes.pages <- me.likes %>% FacebookPagesCollection()
## End(Not run)




