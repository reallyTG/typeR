library(facebook.S4)


### Name: FacebookLikesCollection
### Title: Build a collection of Facebook likes to posts and comments
### Aliases: FacebookLikesCollection

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
##D ## Pull the latest 10 posts from each page in a pages collection
##D  fb.posts <- FacebookPostscollection(id = fb.pages, token = fb_oauth, n = 10)
##D  
##D ## Pull all the likes from each element of the posts collection
##D fb.posts.likes <- FacebookLikesCollection(fb.posts, fb_token, n = Inf)
##D  
##D ## Pull all the available comments from each post of the post collection
##D  fb.comments <- FacebookPostscollection(id = fb.posts, token = fb_oauth, n = Inf)
##D  
##D ## Pull all the likes from each element of the comments collections
##D  fb.comments.likes <- FacebookLikesCollection(id = fb.comments, token = fb_oauth, n = Inf)  
##D    
##D ## Convert the collection to a data frame
##D fb.posts.likes.df <- as.data.frame(fb.posts.likes)
##D 
##D # The same as before in a more compact fashion using the pipe operator
##D # chaining from a Pages then to a Posts Collection and finally building a Likes Collection
##D fb.posts.likes.pipe <- 
##D  FacebookPagesCollection(id = c("9thcirclegames",
##D                                 "NathanNeverSergioBonelliEditore"),
##D                          token = fb_oauth) %>%
##D      FacebookPostscollection(n = 10) %>%
##D      FacebookLikesCollection(n = Inf)
## End(Not run)




