library(mapdeck)


### Name: add_pointcloud
### Title: Add Pointcloud
### Aliases: add_pointcloud

### ** Examples

## No test: 
## You need a valid access token from Mapbox
key <- 'abc'

df <- capitals
df$z <- sample(10000:10000000, size = nrow(df))

mapdeck(token = key, style = 'mapbox://styles/mapbox/dark-v9') %>%
add_pointcloud(
  data = df
  , lon = 'lon'
  , lat = 'lat'
  , elevation = 'z'
  , layer_id = 'point'
  , fill_colour = "country"
)
## End(No test)




