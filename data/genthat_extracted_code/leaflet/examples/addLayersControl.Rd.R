library(leaflet)


### Name: addLayersControl
### Title: Add UI controls to switch layers on and off
### Aliases: addLayersControl layersControlOptions removeLayersControl

### ** Examples

## No test: 
leaflet() %>%
  addTiles(group = "OpenStreetMap") %>%
  addProviderTiles("Stamen.Toner", group = "Toner by Stamen") %>%
  addMarkers(runif(20, -75, -74), runif(20, 41, 42), group = "Markers") %>%
  addLayersControl(
    baseGroups = c("OpenStreetMap", "Toner by Stamen"),
    overlayGroups = c("Markers")
  )
## End(No test)




