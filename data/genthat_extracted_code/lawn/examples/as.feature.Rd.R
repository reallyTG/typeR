library(lawn)


### Name: as.feature
### Title: Coerce character strings or JSON to GeoJSON Feature
### Aliases: as.feature

### ** Examples

poly <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Polygon",
    "coordinates": [[
      [105.818939,21.004714],
      [105.818939,21.061754],
      [105.890007,21.061754],
      [105.890007,21.004714],
      [105.818939,21.004714]
     ]]
  }
}'
as.feature(poly)

pt <- '{"type":"Point","coordinates":[-75.343,39.984]}'
as.feature(pt)

line <- '{
  "type": "LineString",
  "coordinates": [
    [-77.031669, 38.878605],
    [-77.029609, 38.881946],
    [-77.020339, 38.884084],
    [-77.025661, 38.885821],
    [-77.021884, 38.889563],
    [-77.019824, 38.892368]
    ]
}'
as.feature(line)

# returns self if no match - note "Points" is not a GeoJSON type
pt <- '{"type":"Points","coordinates":[-75.343,39.984]}'
as.feature(pt)



