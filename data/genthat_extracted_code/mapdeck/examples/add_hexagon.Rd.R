library(mapdeck)


### Name: add_hexagon
### Title: Add hexagon
### Aliases: add_hexagon

### ** Examples

## Not run: 
##D 
##D ## You need a valid access token from Mapbox
##D key <- 'abc'
##D 
##D df <- read.csv(paste0(
##D 'https://raw.githubusercontent.com/uber-common/deck.gl-data/master/examples/'
##D , '3d-heatmap/heatmap-data.csv'
##D ))
##D 
##D df <- df[!is.na(df$lng), ]
##D 
##D mapdeck( token = key, style = mapdeck_style("dark"), pitch = 45) %>%
##D add_hexagon(
##D   data = df
##D   , lat = "lat"
##D   , lon = "lng"
##D   , layer_id = "hex_layer"
##D   , elevation_scale = 100
##D )
##D 
##D library( sf )
##D sf <- sf::st_as_sf( df, coords = c("lng", "lat"))
##D mapdeck( token = key, style = mapdeck_style("dark"), pitch = 45 ) %>%
##D add_hexagon(
##D   data = sf
##D   , layer_id = "hex_layer"
##D   , elevation_scale = 100
##D )
##D 
## End(Not run)




