library(facebook.S4)


### Name: FacebookPagesCollection
### Title: Build a collection of Facebook pages
### Aliases: FacebookPagesCollection

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D  load("fb_oauth")
##D  
##D ## Getting information about 9th Circle Games' Facebook Page
##D fb.pages <- FacebookPagesCollection(id = c("9thcirclegames", 
##D                                            "NathanNeverSergioBonelliEditore"),
##D                                     token = fb_oauth)
##D 
##D ## Getting informations from the same pages, but with a different set of fields
##D  fb.pages.covers <- FacebookPagesCollection(id = fb.pages,
##D                                             fields = c("id",
##D                                                        "name",
##D                                                        "cover.fields(id,source,height,width)")
##D                                             )
##D  
##D ## Convert the collection to a data frame
##D  fb.pages.df <- as.data.frame(fb.pages)
##D  
##D ## Build a collection of the pages the current user likes
##D  likes.pages <- FacebookUsersCollection("me", fb_token, fields = "") %>%
##D    facebook.object.likes() %>% 
##D    FacebookPagesCollection()
## End(Not run)




