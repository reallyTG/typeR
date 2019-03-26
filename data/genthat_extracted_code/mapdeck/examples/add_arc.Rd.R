library(mapdeck)


### Name: add_arc
### Title: Add arc
### Aliases: add_arc

### ** Examples

## No test: 

## You need a valid access token from Mapbox
key <- 'abc'

url <- 'https://raw.githubusercontent.com/plotly/datasets/master/2011_february_aa_flight_paths.csv'
flights <- read.csv(url)
flights$id <- seq_len(nrow(flights))
flights$stroke <- sample(1:3, size = nrow(flights), replace = T)
flights$info <- paste0("<b>",flights$airport1, " - ", flights$airport2, "</b>")

mapdeck( token = key, style = 'mapbox://styles/mapbox/dark-v9', pitch = 45 ) %>%
  add_arc(
  data = flights
  , layer_id = "arc_layer"
  , origin = c("start_lon", "start_lat")
  , destination = c("end_lon", "end_lat")
  , stroke_from = "airport1"
  , stroke_to = "airport2"
  , stroke_width = "stroke"
  , tooltip = "info"
 )

## Using a 2-sfc-column sf object
library(sf)

sf_flights <- cbind(
  sf::st_as_sf(flights, coords = c("start_lon", "start_lat"))
  , sf::st_as_sf(flights[, c("end_lon","end_lat")], coords = c("end_lon", "end_lat"))
)

mapdeck(
  token = key
) %>%
 add_arc(
   data = sf_flights
   , origin = 'geometry'
   , destination = 'geometry.1'
   , layer_id = 'arcs'
)


## End(No test)




