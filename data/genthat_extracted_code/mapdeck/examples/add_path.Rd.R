library(mapdeck)


### Name: add_path
### Title: Add Path
### Aliases: add_path

### ** Examples

## No test: 

## You need a valid access token from Mapbox
key <- 'abc'

mapdeck(
  token = key
  , style = 'mapbox://styles/mapbox/dark-v9'
  , location = c(145, -37.8)
  , zoom = 10) %>%
  add_path(
    data = roads
    , stroke_colour = "RIGHT_LOC"
    , layer_id = "path_layer"
    , tooltip = "ROAD_NAME"
  )

## End(No test)




