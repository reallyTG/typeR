library(geoops)


### Name: geo_along
### Title: Takes a LineString and returns a Point at a specified distance
###   along the line.
### Aliases: geo_along

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

geo_along(line, 10, 'kilometers')



