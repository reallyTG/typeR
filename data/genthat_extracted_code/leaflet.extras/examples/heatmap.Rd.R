library(leaflet.extras)


### Name: addHeatmap
### Title: Add a heatmap
### Aliases: addHeatmap addGeoJSONHeatmap addKMLHeatmap addCSVHeatmap
###   addGPXHeatmap removeHeatmap clearHeatmap

### ** Examples

leaflet(quakes) %>%
  addProviderTiles(providers$CartoDB.DarkMatter) %>%
  setView( 178, -20, 5 ) %>%
  addHeatmap(
    lng = ~long, lat = ~lat, intensity = ~mag,
    blur = 20, max = 0.05, radius = 15
  )

## for more examples see
# browseURL(system.file("examples/heatmaps.R", package = "leaflet.extras"))
kml <- readr::read_file(
  system.file("examples/data/kml/crimes.kml.zip", package = "leaflet.extras")
)

leaflet() %>%
  setView(-77.0369, 38.9072, 12) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addKMLHeatmap(kml, radius = 7) %>%
  addKML(
    kml,
    markerType = "circleMarker",
    stroke = FALSE, fillColor = "black", fillOpacity = 1,
    markerOptions = markerOptions(radius = 1))

## for more examples see
# browseURL(system.file("examples/KML.R", package = "leaflet.extras"))



