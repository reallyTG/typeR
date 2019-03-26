library(lawn)


### Name: lawn_midpoint
### Title: Get a point midway between two points
### Aliases: lawn_midpoint

### ** Examples

pt1 <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Point",
    "coordinates": [144.834823, -37.771257]
  }
}'
pt2 <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Point",
    "coordinates": [145.14244, -37.830937]
  }
}'
lawn_midpoint(pt1, pt2)
## Not run: 
##D lawn_midpoint(pt1, pt2) %>% view
##D lawn_featurecollection(list(
##D   lawn_point(jsonlite::fromJSON(pt1)$geometry$coordinates),
##D   lawn_point(jsonlite::fromJSON(pt2)$geometry$coordinates),
##D   structure(lawn_midpoint(pt1, pt2), class = "point")
##D )) %>% view
## End(Not run)



