library(tableschema.r)


### Name: types.castGeopoint
### Title: Cast geographic point
### Aliases: types.castGeopoint

### ** Examples


types.castGeopoint(format = "default", value = list(180, 90))

types.castGeopoint(format = "default", value = '180,90')

types.castGeopoint(format = "default", value = '180, -90')

types.castGeopoint(format = "array", value = list(180, 90))

types.castGeopoint(format = "array", value =  '[180, -90]')

types.castGeopoint(format = "object", value = list(lon = 180, lat = 90))

types.castGeopoint(format = "object", value =  '{"lon": 180, "lat": 90}')




