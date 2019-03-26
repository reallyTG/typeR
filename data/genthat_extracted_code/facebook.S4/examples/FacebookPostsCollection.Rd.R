library(facebook.S4)


### Name: FacebookPostsCollection
### Title: Build a collection of Facebook posts
### Aliases: FacebookPostsCollection

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D  load("fb_oauth")
##D  
##D ## Getting information about two example Facebook Pages
##D  fb.pages <- FacebookPagesCollection(id = c("9thcirclegames",
##D                                            "NathanNeverSergioBonelliEditore"), 
##D                                      token = fb_oauth)
##D  
##D ## Pull the latest 10 posts from each page
##D  fb.posts <- FacebookPostscollection(id = fb.pages, token = fb_oauth, n = 10)
##D  
##D ## Pull all the available posts from each page
##D  fb.posts.inf <- FacebookPostscollection(id = fb.pages, token = fb_oauth, n = Inf)
##D  
##D ## Convert the collection to a data frame
##D fb.posts.df <- as.data.frame(fb.posts)
##D 
##D # The same as before in a more compact fashion using the pipe operator
##D # chaining from a Pages Collection
##D  fb.posts.pipe <- FacebookPagesCollection(id = c("9thcirclegames", 
##D                                                 "NathanNeverSergioBonelliEditore"),
##D                                           token = fb_oauth) %>% FacebookPostsCollection(n = 10)
##D    
##D ## Build a collection of sharedposts from a posts collection
##D  fb.sharedposts <- FacebookPostsCollection(id = fb.posts, token = fb_oauth, n = Inf)
## End(Not run)




