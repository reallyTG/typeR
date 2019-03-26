library(facebook.S4)


### Name: FacebookAlbumsCollection
### Title: Build a collection of Facebook albums
### Aliases: FacebookAlbumsCollection

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
##D ## Pull at most 10 albums from each page
##D  fb.albums <- FacebookAlbumscollection(id = fb.pages, token = fb_oauth, n = 10)
##D  
##D ## Pull all the available albums from each page
##D  fb.albums.inf <- FacebookAlbumscollection(id = fb.pages, token = fb_oauth, n = Inf)
##D  
##D ## Convert the collection to a data frame
##D fb.albums.df <- as.data.frame(fb.albums)
##D 
##D # The same as before in a more compact fashion using the pipe operator
##D # chaining from a Pages Collection
##D  fb.albums.pipe <- FacebookPagesCollection(id = c("9thcirclegames", 
##D                                                 "NathanNeverSergioBonelliEditore"),
##D                                           token = fb_oauth) %>% FacebookAlbumsCollection(n = 10)
## End(Not run)




