library(facebook.S4)


### Name: FacebookUsersCollection
### Title: Build a collection of Facebook users
### Aliases: FacebookUsersCollection

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D  load("fb_oauth")
##D  
##D ## Getting information about 9th Circle Games' Facebook Page
##D  fb.pages <- FacebookPagesCollection(id = c("9thcirclegames", 
##D                                             "NathanNeverSergioBonelliEditore"),
##D                                      token = fb_oauth)
##D  
##D ## Getting the commenters of the latest 10 posts
##D  fb.comments <- fb.pages %>% FacebookPostsCollection(n = 10) %>%
##D      FacebookCommentsCollection(fields=c("id",
##D                                          "from.fields(id,name)"),
##D                                 n = Inf)
##D 
##D ## Build a collection of users from who actually commented those posts  
##D  fb.commenting.users <- fb.comments %>% FacebookUsersCollection()
##D  
##D ## Convert the collection to a data frame
##D  fb.commenting.df <- as.data.frame(fb.commenting.users)
## End(Not run)




