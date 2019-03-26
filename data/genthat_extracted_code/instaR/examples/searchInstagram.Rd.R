library(instaR)


### Name: searchInstagram
### Title: Search public media that mention a specific hashtag, or that
###   were sent from a given area
### Aliases: searchInstagram

### ** Examples

## Not run: 
##D ## See examples for instaOAuth to know how token was created.
##D ## Searching and downloading 100 public media that mention #obama
##D  load("my_oauth")
##D  obama <- searchInstagram( tag="obama", token=my_oauth, n=100, folder="obama")
##D ## Searching and downloading pictures sent from Times Square with a minimum date 
##D ## of 2013-12-31 and a maximum date of 2014-01-01
##D  tsq <- searchInstagram( lat=40.7577, lng=-73.9857, distance=500, 
##D     token=my_oauth, n=500, folder="timessquare", 
##D     mindate="2014-12-31", maxdate="2014-01-01")
## End(Not run)




