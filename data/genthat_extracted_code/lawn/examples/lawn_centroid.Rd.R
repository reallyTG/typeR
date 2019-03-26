library(lawn)


### Name: lawn_centroid
### Title: Centroid
### Aliases: lawn_centroid

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
lawn_centroid(features = poly)
lawn_centroid(features = as.feature(poly))
lawn_centroid(features = poly, properties = list(foo = "bar"))



