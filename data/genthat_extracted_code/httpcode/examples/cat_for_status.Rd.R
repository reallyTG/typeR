library(httpcode)


### Name: cat_for_status
### Title: Use cat or dog pictures for various HTTP status codes
### Aliases: cat_for_status dog_for_status

### ** Examples

## Not run: 
##D # give back url
##D cat_for_status(100)
##D dog_for_status(100)
##D cat_for_status(301)
##D dog_for_status(301)
##D cat_for_status(400)
##D dog_for_status(400)
##D 
##D # open image in default browser
##D cat_for_status(400, browse=TRUE)
##D 
##D # not found
##D # cat_for_status(555)
## End(Not run)



