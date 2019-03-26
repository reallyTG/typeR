library(googleway)


### Name: google_map
### Title: Google map
### Aliases: google_map googleway

### ** Examples

## Not run: 
##D 
##D map_key <- "your_api_key"
##D 
##D google_map(key = map_key, data = tram_stops) %>%
##D  add_markers() %>%
##D  add_traffic()
##D 
##D ## style map using 'cobalt simplified' style
##D style <- '[{"featureType":"all","elementType":"all","stylers":[{"invert_lightness":true},
##D {"saturation":10},{"lightness":30},{"gamma":0.5},{"hue":"#435158"}]},
##D {"featureType":"road.arterial","elementType":"all","stylers":[{"visibility":"simplified"}]},
##D {"featureType":"transit.station","elementType":"labels.text","stylers":[{"visibility":"off"}]}]'
##D 
##D google_map(key = map_key, styles = style)
##D 
## End(Not run)




