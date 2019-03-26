library(leaflet.extras)


### Name: propsToHTML
### Title: Converts GeoJSON Feature properties to HTML
### Aliases: propsToHTML propstoHTMLTable setMapWidgetStyle

### ** Examples

## No test: 
geoJson <- jsonlite::fromJSON(readr::read_file(
  paste0(
    "https://raw.githubusercontent.com/MinnPost/simple-map-d3",
    "/master/example-data/world-population.geo.json"
  )
))

world <- leaflet(
  options = leafletOptions(
    maxZoom = 5,
    crs = leafletCRS(
      crsClass = "L.Proj.CRS", code = "ESRI:53009",
      proj4def = "+proj=moll +lon_0=0 +x_0=0 +y_0=0 +a=6371000 +b=6371000 +units=m +no_defs",
      resolutions = c(65536, 32768, 16384, 8192, 4096, 2048)))) %>%
  addGraticule(style = list(color = "#999", weight = 0.5, opacity = 1, fill = NA)) %>%
  addGraticule(sphere = TRUE, style = list(color = "#777", weight = 1, opacity = 0.25, fill = NA))

world

# change background to white
world %>%
  setMapWidgetStyle(list(background = "white"))
## End(No test)





