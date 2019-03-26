library(leaflet.extras)


### Name: addWebGLHeatmap
### Title: Add a webgl heatmap
### Aliases: addWebGLHeatmap addWebGLGeoJSONHeatmap addWebGLKMLHeatmap
###   addWebGLCSVHeatmap addWebGLGPXHeatmap removeWebGLHeatmap
###   clearWebGLHeatmap

### ** Examples

## addWebGLHeatmap
leaflet(quakes) %>%
  addProviderTiles(providers$CartoDB.DarkMatter) %>%
  addWebGLHeatmap(lng = ~long, lat = ~lat, size = 60000)

## for more examples see
# browseURL(system.file("examples/webglHeatmaps.R", package = "leaflet.extras"))
## addWebGLGeoJSONHeatmap
## No test: 
geoJson <- readr::read_file(
  "https://rawgit.com/benbalter/dc-maps/master/maps/historic-landmarks-points.geojson"
)

leaflet() %>%
  setView(-77.0369, 38.9072, 12) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addWebGLGeoJSONHeatmap(
    geoJson, size = 30 , units = "px"
  ) %>%
  addGeoJSONv2(
    geoJson,
    markerType = "circleMarker",
    stroke = FALSE, fillColor = "black", fillOpacity = 0.7,
    markerOptions = markerOptions(radius = 2)
  )
## End(No test)

## for more examples see
# browseURL(system.file("examples/geojsonV2.R", package = "leaflet.extras"))
# browseURL(system.file("examples/TopoJSON.R", package = "leaflet.extras"))
## addWebGLKMLHeatmap
## No test: 
kml <- readr::read_file(
  system.file("examples/data/kml/crimes.kml.zip", package = "leaflet.extras")
)

leaflet() %>% setView(-77.0369, 38.9072, 12) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addWebGLKMLHeatmap(kml, size = 20, units = "px") %>%
  addKML(
    kml,
    markerType = "circleMarker",
    stroke = FALSE, fillColor = "black", fillOpacity = 1,
    markerOptions = markerOptions(radius = 1))
## End(No test)


## addWebGLCSVHeatmap
## No test: 
csv <- readr::read_file(
  system.file("examples/data/csv/world_airports.csv.zip", package = "leaflet.extras")
)

leaflet() %>%
  setView(0, 0, 2) %>%
  addProviderTiles(providers$CartoDB.DarkMatterNoLabels) %>%
  addWebGLCSVHeatmap(
    csv,
    csvParserOptions("latitude_deg", "longitude_deg"),
    size = 10, units = "px")
## End(No test)


## No test: 
airports <- readr::read_file(
  system.file("examples/data/gpx/md-airports.gpx.zip", package = "leaflet.extras")
)

leaflet() %>%
  addBootstrapDependency() %>%
  setView(-76.6413, 39.0458, 8) %>%
  addProviderTiles(
    providers$CartoDB.Positron,
    options = providerTileOptions(detectRetina = TRUE)
  ) %>%
  addWebGLGPXHeatmap(
    airports,
    size = 20000,
    group = "airports",
    opacity = 0.9
  ) %>%
  addGPX(
    airports,
    markerType = "circleMarker",
    stroke = FALSE, fillColor = "black", fillOpacity = 1,
    markerOptions = markerOptions(radius = 1.5),
    group = "airports"
  )
## End(No test)


## for a larger example see
# browseURL(system.file("examples/GPX.R", package = "leaflet.extras"))



