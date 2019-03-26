library(googleway)


### Name: add_overlay
### Title: Add Overlay
### Aliases: add_overlay

### ** Examples

## Not run: 
##D 
##D map_key <- 'your_api_key'
##D 
##D google_map(key = map_key) %>%
##D   add_overlay(north = 40.773941, south = 40.712216, east = -74.12544, west = -74.22655,
##D                overlay_url = "https://www.lib.utexas.edu/maps/historical/newark_nj_1922.jpg")
##D 
##D 
##D url <- paste0("https://developers.google.com/maps/documentation/javascript",
##D   "/examples/full/images/talkeetna.png")
##D 
##D google_map(key = map_key) %>%
##D   add_overlay(north = 62.400471, south = 62.281819, east = -150.005608, west = -150.287132,
##D                overlay_url = url)
##D 
##D 
## End(Not run)



