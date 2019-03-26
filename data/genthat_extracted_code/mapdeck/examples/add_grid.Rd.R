library(mapdeck)


### Name: add_grid
### Title: Add Grid
### Aliases: add_grid

### ** Examples

## No test: 
## You need a valid access token from Mapbox
key <- 'abc'

df <- read.csv(paste0(
'https://raw.githubusercontent.com/uber-common/deck.gl-data/master/',
'examples/3d-heatmap/heatmap-data.csv'
))


mapdeck( token = key, style = 'mapbox://styles/mapbox/dark-v9', pitch = 45 ) %>%
add_grid(
  data = df
  , lat = "lat"
  , lon = "lng"
  , cell_size = 5000
  , elevation_scale = 50
  , layer_id = "grid_layer"
)
## End(No test)




