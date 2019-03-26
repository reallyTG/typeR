library(lawn)


### Name: lawn_transform_rotate
### Title: Rotate a GeoJSON feature
### Aliases: lawn_transform_rotate

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
lawn_transform_rotate(x, angle = 100, pivot = c(15, 15))

lawn_transform_rotate(x, angle = 100)
lawn_transform_rotate(x, angle = 100, mutate = TRUE)

## Not run: 
##D view(lawn_featurecollection(x))
##D view(lawn_featurecollection(lawn_transform_rotate(x, angle = 100)))
##D view(lawn_featurecollection(
##D   lawn_transform_rotate(x, angle = 100, pivot = c(15, 15))
##D ))
##D view(lawn_featurecollection(
##D   lawn_transform_rotate(x, angle = 150, pivot = c(15, 15))
##D ))
##D view(lawn_featurecollection(
##D   lawn_transform_rotate(x, angle = 300, pivot = c(0, 4))
##D ))
## End(Not run)



