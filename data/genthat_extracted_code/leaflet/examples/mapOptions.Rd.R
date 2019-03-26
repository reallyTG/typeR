library(leaflet)


### Name: mapOptions
### Title: Set options on a leaflet map object
### Aliases: mapOptions

### ** Examples

# Don't auto-zoom to the objects (can be useful in interactive applications)
leaflet() %>%
  addTiles() %>%
  addPopups(174.7690922, -36.8523071, "R was born here!") %>%
  mapOptions(zoomToLimits = "first")



