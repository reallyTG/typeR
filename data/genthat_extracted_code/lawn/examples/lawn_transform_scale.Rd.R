library(lawn)


### Name: lawn_transform_scale
### Title: Scale a GeoJSON feature
### Aliases: lawn_transform_scale

### ** Examples

x <- '{
 "type": "Feature",
 "properties": {},
 "geometry": {
   "type": "Polygon",
   "coordinates": [
    [
      [ 0, 29 ], [ 3.5, 29 ], [ 2.5, 32 ], [ 0, 29 ]
    ]
  ]
 }
}'
lawn_transform_scale(x, factor = 3)

lawn_transform_scale(x, factor = 100)
lawn_transform_scale(x, factor = 100, mutate = TRUE)

## Not run: 
##D view(lawn_featurecollection(x))
##D view(lawn_featurecollection(
##D   lawn_transform_scale(x, factor = 2)
##D ))
##D view(lawn_featurecollection(
##D   lawn_transform_scale(x, factor = 3)
##D ))
##D view(lawn_featurecollection(
##D   lawn_transform_scale(x, factor = 2, origin = "sw")
##D ))
##D view(lawn_featurecollection(
##D   lawn_transform_scale(x, factor = 2, origin = "ne")
##D ))
## End(Not run)



