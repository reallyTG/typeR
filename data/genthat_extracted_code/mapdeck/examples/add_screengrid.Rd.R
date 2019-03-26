library(mapdeck)


### Name: add_screengrid
### Title: Add Screengrid
### Aliases: add_screengrid

### ** Examples

## No test: 

## You need a valid access token from Mapbox
key <- 'abc'

df <- read.csv(paste0(
'https://raw.githubusercontent.com/uber-common/deck.gl-data/master/',
'examples/3d-heatmap/heatmap-data.csv'
))

df$weight <- sample(1:10, size = nrow(df), replace = T)

mapdeck( token = key, style = mapdeck_style('dark'), pitch = 45 ) %>%
add_screengrid(
  data = df
  , lat = "lat"
  , lon = "lng"
  , weight = "weight",
  , layer_id = "screengrid_layer"
  , cell_size = 10
  , opacity = 0.3
)
## End(No test)




