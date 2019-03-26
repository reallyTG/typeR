library(lawn)


### Name: lawn_transform_translate
### Title: Translate a GeoJSON feature
### Aliases: lawn_transform_translate

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
lawn_transform_translate(x, distance = 100, direction = 35)

lawn_transform_translate(x, distance = 100, direction = 24)
lawn_transform_translate(x, distance = 100, direction = 24, mutate = TRUE)

## Not run: 
##D view(lawn_featurecollection(x))
##D view(lawn_featurecollection(
##D   lawn_transform_translate(x, distance = 130, direction = 35,
##D    units = "kilometers")
##D ))
##D view(lawn_featurecollection(
##D   lawn_transform_translate(x, distance = 130, direction = -35,
##D    units = "kilometers")
##D ))
##D view(lawn_featurecollection(
##D   lawn_transform_translate(x, distance = 130, direction = 35,
##D    units = "kilometers", zTranslation = 10)
##D ))
##D view(lawn_featurecollection(
##D   lawn_transform_translate(x, distance = 130, direction = 35,
##D    units = "kilometers", mutate = TRUE)
##D ))
## End(Not run)



