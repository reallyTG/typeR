library(lawn)


### Name: lawn_concave
### Title: Concave hull polygon
### Aliases: lawn_concave

### ** Examples

## Not run: 
##D points <- '{
##D   "type": "FeatureCollection",
##D   "features": [
##D     {
##D       "type": "Feature",
##D       "properties": {},
##D       "geometry": {
##D         "type": "Point",
##D         "coordinates": [-63.601226, 44.642643]
##D       }
##D     }, {
##D       "type": "Feature",
##D       "properties": {},
##D       "geometry": {
##D         "type": "Point",
##D         "coordinates": [-63.591442, 44.651436]
##D       }
##D     }, {
##D       "type": "Feature",
##D       "properties": {},
##D       "geometry": {
##D         "type": "Point",
##D         "coordinates": [-63.580799, 44.648749]
##D       }
##D     }, {
##D       "type": "Feature",
##D       "properties": {},
##D       "geometry": {
##D         "type": "Point",
##D         "coordinates": [-63.573589, 44.641788]
##D       }
##D     }, {
##D       "type": "Feature",
##D       "properties": {},
##D       "geometry": {
##D         "type": "Point",
##D         "coordinates": [-63.587665, 44.64533]
##D       }
##D     }, {
##D       "type": "Feature",
##D       "properties": {},
##D       "geometry": {
##D         "type": "Point",
##D         "coordinates": [-63.595218, 44.64765]
##D       }
##D     }
##D     ]
##D }'
##D lawn_concave(points, 1)
##D 
##D lawn_concave(points) %>% view
## End(Not run)



