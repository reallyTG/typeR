library(lawn)


### Name: lawn_within
### Title: Return points that fall within polygons
### Aliases: lawn_within

### ** Examples

## Not run: 
##D cat(lawn_data$points_within)
##D cat(lawn_data$polygons_within)
##D lawn_within(lawn_data$points_within, lawn_data$polygons_within)
##D 
##D pt <- '{
##D  "type": "Feature",
##D  "properties": {},
##D  "geometry": {
##D     "type": "Point",
##D     "coordinates": [-90.548630, 14.616599]
##D   }
##D }'
##D poly <- lawn_featurecollection(lawn_buffer(pt, 5))
##D pts <- lawn_featurecollection(lawn_point(c(-90.55, 14.62)))
##D 
##D lawn_within(pts, poly)
## End(Not run)



