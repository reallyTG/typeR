library(leaflet.extras)


### Name: addStyleEditor
### Title: Add style editor
### Aliases: addStyleEditor removeStyleEditor

### ** Examples

leaflet() %>%
  setView(0, 0, 2) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addDrawToolbar(
    targetGroup = "draw",
    editOptions = editToolbarOptions(selectedPathOptions = selectedPathOptions())
  ) %>%
  addLayersControl(
    overlayGroups = c("draw"), options = layersControlOptions(collapsed = FALSE)
  ) %>%
  # add the style editor to alter shapes added to map
  addStyleEditor()



