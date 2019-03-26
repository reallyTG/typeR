library(googleway)


### Name: update_geojson
### Title: update geojson
### Aliases: update_geojson

### ** Examples

## Not run: 
##D 
##D style <- paste0('{
##D     "property" : "AREASQKM",
##D     "value" : 5,
##D     "operator" : ">=",
##D     "features" : {
##D       "fillColor" : "red",
##D       "strokeColor" : "red"
##D     }
##D   }')
##D 
##D google_map(key = map_key) %>%
##D     add_geojson(data = geo_melbourne) %>%
##D     update_geojson(style = style)
##D 
##D lst_style <- list(property = "AREASQKM", operator = "<=", value = 5,
##D    features = list(fillColor = "red",
##D    strokeColor = "red"))
##D 
##D google_map(key = map_key) %>%
##D     add_geojson(data = geo_melbourne) %>%
##D     update_geojson(style = lst_style)
##D 
##D ## Styling a specific feature
##D style <- '{"property" : "SA2_NAME", "value" : "Abbotsford", "features" : { "fillColor" : "red" } }'
##D google_map(key = map_key) %>%
##D   add_geojson(data = geo_melbourne) %>%
##D   update_geojson(style = style)
##D 
## End(Not run)




