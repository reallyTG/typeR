library(lawn)


### Name: lawn_nearest
### Title: Get nearest point
### Aliases: lawn_nearest

### ** Examples

point <- '{
  "type": "Feature",
  "properties": {
    "marker-color": "#0f0"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [28.965797, 41.010086]
  }
}'
against <- '{
 "type": "FeatureCollection",
 "features": [
   {
     "type": "Feature",
     "properties": {},
     "geometry": {
       "type": "Point",
       "coordinates": [28.973865, 41.011122]
     }
   }, {
     "type": "Feature",
     "properties": {},
     "geometry": {
       "type": "Point",
       "coordinates": [28.948459, 41.024204]
     }
   }, {
     "type": "Feature",
     "properties": {},
     "geometry": {
       "type": "Point",
       "coordinates": [28.938674, 41.013324]
     }
   }
 ]
}'
lawn_nearest(point, against)

## Not run: 
##D lawn_nearest(point, against) %>% view
## End(Not run)



