library(lawn)


### Name: lawn_bearing
### Title: Get geographic bearing between two points
### Aliases: lawn_bearing

### ** Examples

start <- '{
 "type": "Feature",
 "properties": {
   "marker-color": "#f00"
 },
 "geometry": {
   "type": "Point",
   "coordinates": [-75.343, 39.984]
 }
}'

end <- '{
  "type": "Feature",
  "properties": {
    "marker-color": "#0f0"
  },
  "geometry": {
    "type": "Point",
    "coordinates": [-75.534, 39.123]
  }
}'
lawn_bearing(start, end)



