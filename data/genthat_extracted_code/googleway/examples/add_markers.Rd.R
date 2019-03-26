library(googleway)


### Name: add_markers
### Title: Add markers
### Aliases: add_markers

### ** Examples

## Not run: 
##D 
##D map_key <- "your api key"
##D 
##D google_map(key = map_key, data = tram_stops) %>%
##D  add_markers(lat = "stop_lat", lon = "stop_lon", info_window = "stop_name")
##D 
##D 
##D ## using marker icons
##D iconUrl <- paste0("https://developers.google.com/maps/documentation/",
##D "javascript/examples/full/images/beachflag.png")
##D 
##D tram_stops$icon <- iconUrl
##D 
##D google_map(key = map_key, data = tram_stops) %>%
##D   add_markers(lat = "stop_lat", lon = "stop_lon", marker_icon = "icon")
##D 
## End(Not run)



