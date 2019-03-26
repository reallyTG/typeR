library(googleway)


### Name: add_geojson
### Title: Add GeoJson
### Aliases: add_geojson

### ** Examples

## Not run: 
##D 
##D 
##D ## use the properties inside the geoJSON to style each feature
##D google_map(key = map_key) %>%
##D   add_geojson(data = geo_melbourne)
##D 
##D ## use a JSON string to style all features
##D style <- '{ "fillColor" : "green" , "strokeColor" : "black", "strokeWeight" : 0.5}'
##D google_map(key = map_key) %>%
##D   add_geojson(data = geo_melbourne, style = style)
##D 
##D 
##D ## use a named list to style all features
##D style <- list(fillColor = "red" , strokeColor = "blue", strokeWeight = 0.5)
##D google_map(key = map_key) %>%
##D   add_geojson(data = geo_melbourne, style = style)
##D 
##D ## GeoJSON from a URL
##D url <- 'https://storage.googleapis.com/mapsdevsite/json/google.json'
##D google_map(key = map_key) %>%
##D   add_geojson(data = url, mouse_over = T)
##D 
## End(Not run)




