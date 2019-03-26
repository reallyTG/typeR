library(mapdeck)


### Name: add_geojson
### Title: Add Geojson
### Aliases: add_geojson

### ** Examples

## No test: 

## You need a valid access token from Mapbox
key <- 'abc'

mapdeck(
 token = key
 , location = c(145, -37.9)
 , zoom = 8
 , style = "mapbox://styles/mapbox/dark-v9"
 , pitch = 35
) %>%
 add_geojson(
   data = geojson
   , layer_id = "geojson"
 )

## add colours, elevation and opacities
sf <- geojsonsf::geojson_sf(geojson)
sf$elevation <- sample(100:1000, size = nrow(sf), replace = T)
sf$fillOpacity <- sample(200:255, size = nrow(sf), replace = T)
sf$radius <- sample(1:100, size = nrow(sf), replace = T)

mapdeck(
  token = key
  , location = c(145, -37.9)
  , zoom = 8
  , style = "mapbox://styles/mapbox/dark-v9"
  , pitch = 35
) %>%
  add_geojson(
    data = sf
    , lineWidth = 250,
    , layer_id = "geojson"
 )
## End(No test)





