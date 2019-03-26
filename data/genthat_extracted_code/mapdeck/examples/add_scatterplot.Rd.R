library(mapdeck)


### Name: add_scatterplot
### Title: Add Scatterplot
### Aliases: add_scatterplot

### ** Examples


## No test: 
## You need a valid access token from Mapbox
key <- 'abc'

mapdeck( token = key, style = 'mapbox://styles/mapbox/dark-v9', pitch = 45 ) %>%
add_scatterplot(
  data = capitals
  , lat = "lat"
  , lon = "lon"
  , radius = 100000
  , fill_colour = "country"
  , layer_id = "scatter_layer"
)

df <- read.csv(paste0(
'https://raw.githubusercontent.com/uber-common/deck.gl-data/master/',
'examples/3d-heatmap/heatmap-data.csv'
))

mapdeck( token = key, style = 'mapbox://styles/mapbox/dark-v9', pitch = 45 ) %>%
add_scatterplot(
  data = df
  , lat = "lat"
  , lon = "lng"
  , layer_id = "scatter_layer"
)
## End(No test)




