library(leaflet.extras)


### Name: addSearchOSM
### Title: Add a OSM search control to the map.
### Aliases: addSearchOSM removeSearchOSM addReverseSearchOSM
###   addSearchGoogle removeSearchGoogle addReverseSearchGoogle
###   addSearchUSCensusBureau removeSearchUSCensusBureau

### ** Examples

leaflet() %>%
  addProviderTiles(providers$Esri.WorldStreetMap) %>%
  addResetMapButton() %>%
  addSearchGoogle()

## for more examples see
# browseURL(system.file("examples/search.R", package = "leaflet.extras"))





