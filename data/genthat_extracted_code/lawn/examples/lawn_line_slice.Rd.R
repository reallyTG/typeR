library(lawn)


### Name: lawn_line_slice
### Title: Slice a line given two points
### Aliases: lawn_line_slice

### ** Examples

start <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Point",
    "coordinates": [-77.029609, 38.881946]
  }
}'
stop <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Point",
    "coordinates": [-77.021884, 38.889563]
  }
}'
line <- '{
 "type": "Feature",
 "properties": {},
 "geometry": {
   "type": "LineString",
   "coordinates": [
     [-77.031669, 38.878605],
     [-77.029609, 38.881946],
     [-77.020339, 38.884084],
     [-77.025661, 38.885821],
     [-77.021884, 38.889563],
     [-77.019824, 38.892368]
    ]
  }
}'
lawn_line_slice(start, stop, line)

# lint input objects
lawn_line_slice(start, stop, line, TRUE)
## Not run: 
##D line %>% view
##D lawn_line_slice(point1 = start, point2 = stop, line) %>% view
## End(Not run)



