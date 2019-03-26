library(leaflet.extras)


### Name: addGeoJSONv2
### Title: Adds a GeoJSON/TopoJSON to the leaflet map.
### Aliases: addGeoJSONv2 legendOptions addGeoJSONChoropleth addKML
###   addKMLChoropleth csvParserOptions addCSV addGPX

### ** Examples

## addGeoJSONv2
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
# browseURL(system.file("examples/draw.R", package = "leaflet.extras"))
# browseURL(system.file("examples/geojsonv2.R", package = "leaflet.extras"))
# browseURL(system.file("examples/search.R", package = "leaflet.extras"))
# browseURL(system.file("examples/TopoJSON.R", package = "leaflet.extras"))


## addGeoJSONChoropleth
## No test: 
geoJson <- readr::read_file(
  "https://rawgit.com/benbalter/dc-maps/master/maps/ward-2012.geojson"
)

leaflet() %>%
  addTiles() %>%
  setView(-77.0369, 38.9072, 11) %>%
  addBootstrapDependency() %>%
  enableMeasurePath() %>%
  addGeoJSONChoropleth(
    geoJson,
    valueProperty = "AREASQMI",
    scale = c("white", "red"),
    mode = "q",
    steps = 4,
    padding = c(0.2, 0),
    labelProperty = "NAME",
    popupProperty = propstoHTMLTable(
      props = c("NAME", "AREASQMI", "REP_NAME", "WEB_URL", "REP_PHONE", "REP_EMAIL", "REP_OFFICE"),
      table.attrs = list(class = "table table-striped table-bordered"),
      drop.na = TRUE
    ),
    color = "#ffffff", weight = 1, fillOpacity = 0.7,
    highlightOptions = highlightOptions(
      weight = 2, color = "#000000",
      fillOpacity = 1, opacity = 1,
      bringToFront = TRUE, sendToBack = TRUE),
    pathOptions = pathOptions(
      showMeasurements = TRUE,
      measurementOptions = measurePathOptions(imperial = TRUE)))
## End(No test)

## for more examples see
# browseURL(system.file("examples/geojsonv2.R", package = "leaflet.extras"))
# browseURL(system.file("examples/measurePath.R", package = "leaflet.extras"))
# browseURL(system.file("examples/search.R", package = "leaflet.extras"))
# browseURL(system.file("examples/TopoJSON.R", package = "leaflet.extras"))


## addKML
## No test: 
kml <- readr::read_file(
  system.file("examples/data/kml/crimes.kml.zip", package = "leaflet.extras")
)

leaflet() %>%
  setView(-77.0369, 38.9072, 12) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addWebGLKMLHeatmap(kml, size = 20, units = "px") %>%
  addKML(
    kml,
    markerType = "circleMarker",
    stroke = FALSE, fillColor = "black", fillOpacity = 1,
    markerOptions = markerOptions(radius = 1)
  )
## End(No test)


## addKMLChoropleth
## No test: 
kml <- readr::read_file(
  system.file("examples/data/kml/cb_2015_us_state_20m.kml.zip", package = "leaflet.extras")
)

leaflet() %>%
  addBootstrapDependency() %>%
  setView(-98.583333, 39.833333, 4) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addKMLChoropleth(
    kml,
    valueProperty = JS(
      'function(feature){
         var props = feature.properties;
         var aland = props.ALAND/100000;
         var awater = props.AWATER/100000;
         return 100*awater/(awater+aland);
      }'
    ),
    scale = "OrRd", mode = "q", steps = 5,
    padding = c(0.2, 0),
    popupProperty = "description",
    labelProperty = "NAME",
    color = "#ffffff", weight = 1, fillOpacity = 1,
    highlightOptions = highlightOptions(
      fillOpacity = 1, weight = 2, opacity = 1, color = "#000000",
      bringToFront = TRUE, sendToBack = TRUE
    ),
    legendOptions = legendOptions(
      title = "% of Water Area",
      numberFormatOptions = list(
        style = "decimal",
        maximumFractionDigits = 2
      )
    )
  )
## End(No test)


## addCSV
## No test: 
csv <- readr::read_file(
  system.file("examples/data/csv/world_airports.csv.zip", package = "leaflet.extras")
)

leaflet() %>%
  setView(0, 0, 2) %>%
  addProviderTiles(providers$CartoDB.DarkMatterNoLabels) %>%
  addCSV(
    csv,
    csvParserOptions("latitude_deg", "longitude_deg"),
    markerType = "circleMarker",
    stroke = FALSE, fillColor = "red", fillOpacity = 1,
    markerOptions = markerOptions(radius = 0.5))
## End(No test)


## addGPX
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
  addWebGLGPXHeatmap(airports, size = 20000, group = "airports", opacity = 0.9) %>%
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





