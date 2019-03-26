library(facebook.S4)


### Name: [,FacebookGenericCollection,ANY,ANY-method
### Title: Return parts of a Facebook collection
### Aliases: [,FacebookGenericCollection,ANY,ANY-method
###   [,FacebookGenericCollection-method

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
##D ## Pull at most 20 albums from each page
##D  fb.albums <- FacebookAlbumscollection(id = fb.pages, token = fb_oauth, n = 20)
##D  
##D ## Create a new collection skipping the first 10 albums
##D  fb.oldest.albums <- fb.albums[11:length(fb.oldest.albums)]
## End(Not run)



