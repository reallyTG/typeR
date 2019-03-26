library(facebook.S4)


### Name: FacebookCommentsCollection
### Title: Build a collection of Facebook comments to posts
### Aliases: FacebookCommentsCollection

### ** Examples

## Not run: 
##D ## See examples for fbOAuth to know how token was created.
##D  load("fb_oauth")
##D  
##D ## Getting information about two example Facebook Pages
##D  fb.pages <- FacebookPagesCollection(id = c("9thcirclegames", 
##D                                             "NathanNeverSergioBonelliEditore"),
##D                                      token = fb_oauth)
##D  
##D ## Pull the latest 10 posts from each page in a post collection
##D  fb.posts <- FacebookPostscollection(id = fb.pages, token = fb_oauth, n = 10)
##D  
##D ## Pull all the available posts from each page in a post collection
##D  fb.posts.inf <- FacebookPostscollection(id = fb.pages, token = fb_oauth, n = Inf)
##D 
##D ## Pull all the available comments from each post of the first collection
##D  fb.comments.inf <- FacebookPostscollection(id = fb.posts, token = fb_oauth)
##D    
##D ## Convert the collection to a data frame
##D fb.comments <- as.data.frame(fb.comments)
##D 
##D # The same as before in a more compact fashion using the pipe operator
##D # chaining first from a pages and then a posts collection
##D fb.comments.pipe <- 
##D  FacebookPagesCollection(id = c("9thcirclegames", 
##D                                 "NathanNeverSergioBonelliEditore"),
##D                          token = fb_oauth) %>% 
##D    FacebookPostscollection(n = 10) %>% 
##D    FacebookCommentsCollection(n = Inf)
## End(Not run)




