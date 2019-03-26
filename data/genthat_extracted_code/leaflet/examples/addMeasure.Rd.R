library(leaflet)


### Name: addMeasure
### Title: Add a measure control to the map.
### Aliases: addMeasure

### ** Examples

leaf <- leaflet() %>%
  addTiles() %>%
  # central park
  fitBounds( -73.9, 40.75, -73.95, 40.8 ) %>%
  addMeasure()

leaf

# customizing
leaf %>% addMeasure(
  position = "bottomleft",
  primaryLengthUnit = "meters",
  primaryAreaUnit = "sqmeters",
  activeColor = "#3D535D",
  completedColor = "#7D4479",
  localization = "de"
)




