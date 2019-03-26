library(lawn)


### Name: lawn_point_on_line
### Title: Get closest point on linestring to reference point
### Aliases: lawn_point_on_line

### ** Examples

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
pt <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Point",
    "coordinates": [-77.037076, 38.884017]
  }
}'
lawn_point_on_line(line, pt)

# lint input objects
lawn_point_on_line(line, pt, TRUE)
## Not run: 
##D line %>% view
##D pt %>% view
##D lawn_point_on_line(line, pt) %>% view
## End(Not run)



