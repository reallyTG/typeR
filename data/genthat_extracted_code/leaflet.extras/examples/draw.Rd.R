library(leaflet.extras)


### Name: addDrawToolbar
### Title: Adds a Toolbar to draw shapes/points on the map.
### Aliases: addDrawToolbar removeDrawToolbar

### ** Examples

leaflet() %>%
  setView(0, 0, 2) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addDrawToolbar(
    targetGroup = "draw",
    editOptions = editToolbarOptions(
      selectedPathOptions = selectedPathOptions()
    )
  )  %>%
  addLayersControl(
    overlayGroups = c("draw"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
  addStyleEditor()

## for more examples see
# browseURL(system.file("examples/draw.R", package = "leaflet.extras"))



