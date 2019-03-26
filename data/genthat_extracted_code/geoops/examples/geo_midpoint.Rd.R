library(geoops)


### Name: geo_midpoint
### Title: Midpoint
### Aliases: geo_midpoint

### ** Examples

pt1 <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Point",
    "coordinates": [144.834823, -37.771257]
  }
}'
pt2 <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Point",
    "coordinates": [145.14244, -37.830937]
  }
}'

geo_midpoint(pt1, pt2)



