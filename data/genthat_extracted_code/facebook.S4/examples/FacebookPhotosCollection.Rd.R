library(facebook.S4)


### Name: FacebookPhotosCollection
### Title: Build a collection of Facebook photos to posts
### Aliases: FacebookPhotosCollection

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
##D ## Pull all the available photos from each album
##D  fb.photos.inf <- FacebookPhotoscollection(id = fb.albums, n = Inf)
## End(Not run)




