library(rbokeh)


### Name: nyctaxihex
### Title: Hexagon binned counts of NYC taxi pickup locations
### Aliases: nyctaxihex
### Keywords: data

### ** Examples

## Not run: 
##D gmap(title = "NYC taxi pickups January 2013",
##D   lat = 40.74, lng = -73.95, zoom = 11,
##D   map_type = "roadmap", width = 1000, height = 800) %>%
##D   ly_hexbin(nyctaxihex, alpha = 0.5,
##D     palette = "Spectral10", trans = log, inv = exp)
## End(Not run)



