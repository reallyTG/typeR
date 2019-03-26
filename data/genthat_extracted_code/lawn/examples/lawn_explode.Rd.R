library(lawn)


### Name: lawn_explode
### Title: Explode vertices to points
### Aliases: lawn_explode

### ** Examples

poly <- '{
 "type": "Feature",
 "properties": {},
 "geometry": {
   "type": "Polygon",
   "coordinates": [[
     [177.434692, -17.77517],
     [177.402076, -17.779093],
     [177.38079, -17.803937],
     [177.40242, -17.826164],
     [177.438468, -17.824857],
     [177.454948, -17.796746],
     [177.434692, -17.77517]
    ]]
 }
}'
lawn_explode(poly)
## Not run: 
##D lawn_data$polygons_average %>% view
##D lawn_explode(lawn_data$polygons_average) %>% view
##D lawn_data$polygons_within %>% view
##D lawn_explode(lawn_data$polygons_within) %>% view
## End(Not run)



