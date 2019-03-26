library(lawn)


### Name: lawn_planepoint
### Title: Calculate a Planepoint
### Aliases: lawn_planepoint

### ** Examples

pt <- lawn_point(c(-75.3221, 39.529))
triangle <- '{
  "type": "Feature",
  "properties": {
    "a": 11,
    "b": 122,
    "c": 44
  },
  "geometry": {
    "type": "Polygon",
    "coordinates": [[
      [-75.1221, 39.57],
      [-75.58, 39.18],
      [-75.97, 39.86],
      [-75.1221, 39.57]
    ]]
  }
}'
lawn_planepoint(pt, triangle)



