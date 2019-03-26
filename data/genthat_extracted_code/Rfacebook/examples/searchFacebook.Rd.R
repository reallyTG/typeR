library(Rfacebook)


### Name: searchFacebook
### Title: Search public posts that mention a string
### Aliases: searchFacebook

### ** Examples

## Not run: 
##D ## Searching 100 public posts that mention "facebook"
##D posts <- searchFacebook( string="facebook", token=fb_oauth, n=100 )
##D ## Searching 100 public posts that mention "facebook" from yesterday
##D posts <- searchFacebook( string="facebook", token=fb_oauth, n=100,
##D    since = "yesterday 00:00", until = "yesterday 23:59" )
## End(Not run)




