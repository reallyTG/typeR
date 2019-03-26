library(shutterstock)


### Name: getVideoDetails
### Title: Get details about videos
### Aliases: getVideoDetails

### ** Examples

## Not run: 
##D # get details of a single video:
##D getVideoDetails(id = "18002566")
##D 
##D # multiple videos by lapply:
##D lapply(c("18002566", "17139196"), function(v) getVideoDetails(id = v))
##D 
##D # get multiple videos by for loop:
##D videos <- list()
##D for (v in c("18002566", "17139196")) {
##D videos[[v]] <- getVideoDetails(id = v)
##D }
## End(Not run)



