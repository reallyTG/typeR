library(lawn)


### Name: lawn_line_distance
### Title: Measure a linestring
### Aliases: lawn_line_distance

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
lawn_line_distance(line, 'kilometers')
lawn_line_distance(line, 'miles')
lawn_line_distance(line, 'radians')
lawn_line_distance(line, 'degrees')



