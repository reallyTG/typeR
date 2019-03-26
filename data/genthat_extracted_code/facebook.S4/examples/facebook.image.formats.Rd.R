library(facebook.S4)


### Name: facebook.image.formats
### Title: Pull the list of image formats available from a set of photos
### Aliases: facebook.image.formats

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
##D  
##D ## Pull all the available formats for those photos
##D  fb.images.inf <- FacebookImagescollection(id = fb.photos.inf, n = Inf)
## End(Not run)




