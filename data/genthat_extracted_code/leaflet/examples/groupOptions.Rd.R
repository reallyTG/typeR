library(leaflet)


### Name: groupOptions
### Title: Set options on layer groups
### Aliases: groupOptions

### ** Examples

pal <- colorQuantile("YlOrRd", quakes$mag)

leaflet() %>%
  # Basic markers
  addTiles(group = "basic") %>%
  addMarkers(data = quakes, group = "basic") %>%
  # When zoomed in, we'll show circles at the base of each marker whose
  # radius and color reflect the magnitude
  addProviderTiles(providers$Stamen.TonerLite, group = "detail") %>%
  addCircleMarkers(data = quakes, group = "detail", fillOpacity = 0.5,
    radius = ~mag * 5, color = ~pal(mag), stroke = FALSE) %>%
  # Set the detail group to only appear when zoomed in
  groupOptions("detail", zoomLevels = 7:18)




