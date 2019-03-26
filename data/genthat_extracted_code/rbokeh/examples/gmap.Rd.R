library(rbokeh)


### Name: gmap
### Title: Initialize a Bokeh Google Map plot
### Aliases: gmap

### ** Examples

## No test: 
# custom map style
gmap(lat = 40.74, lng = -73.95, zoom = 11,
  width = 600, height = 600,
  map_style = gmap_style("blue_water"))
## End(No test)
## Not run: 
##D gmap(title = "NYC taxi pickups January 2013",
##D   lat = 40.74, lng = -73.95, zoom = 11,
##D   map_type = "roadmap", width = 1000, height = 800) %>%
##D   ly_hexbin(nyctaxihex, alpha = 0.5,
##D     palette = "Spectral10", trans = log, inv = exp)
## End(Not run)



