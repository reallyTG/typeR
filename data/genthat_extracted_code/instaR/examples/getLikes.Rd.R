library(instaR)


### Name: getLikes
### Title: Get the list of users who liked a photo.
### Aliases: getLikes

### ** Examples

## Not run: 
##D ## See examples for instaOAuth to know how token was created.
##D ## Downloading list of users who liked @barackobama's most recent photo
##D  load("my_oauth")
##D  obama <- getUserMedia( username="barackobama", token=my_oauth, n=1)
##D  likes <- getLikes(obama$id[1], token=my_oauth)
## End(Not run)




