library(lawn)


### Name: lawn_difference
### Title: Difference
### Aliases: lawn_difference

### ** Examples

## Not run: 
##D # skipping on cran
##D poly1 <- '{
##D  "type": "Feature",
##D   "properties": {
##D     "fill": "#0f0"
##D   },
##D   "geometry": {
##D     "type": "Polygon",
##D     "coordinates": [[
##D       [-46.738586, -23.596711],
##D       [-46.738586, -23.458207],
##D       [-46.560058, -23.458207],
##D       [-46.560058, -23.596711],
##D       [-46.738586, -23.596711]
##D     ]]
##D   }
##D }'
##D 
##D poly2 <- '{
##D   "type": "Feature",
##D   "properties": {
##D     "fill": "#00f"
##D   },
##D   "geometry": {
##D     "type": "Polygon",
##D     "coordinates": [[
##D       [-46.650009, -23.631314],
##D       [-46.650009, -23.5237],
##D       [-46.509246, -23.5237],
##D       [-46.509246, -23.631314],
##D       [-46.650009, -23.631314]
##D     ]]
##D   }
##D }'
##D lawn_difference(poly1, poly2)
## End(Not run)
## Not run: 
##D lawn_featurecollection(list(poly1, poly2)) %>% view
##D lawn_difference(poly1, poly2) %>% view
##D fc <- lawn_featurecollection(list(
##D    lawn_polygon(jsonlite::fromJSON(poly1)$geometry$coordinates),
##D    lawn_polygon(jsonlite::fromJSON(poly2)$geometry$coordinates)
##D ))
##D view(fc)
## End(Not run)



