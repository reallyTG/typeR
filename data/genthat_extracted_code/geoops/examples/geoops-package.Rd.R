library(geoops)


### Name: geoops-package
### Title: geoops
### Aliases: geoops-package geoops
### Keywords: package

### ** Examples

library("geoops")

# Calculate distance between two GeoJSON points
pt1 <- '{
  "type": "Feature",
  "properties": {
    "marker-color": "#f00"
   },
   "geometry": {
      "type": "Point",
      "coordinates": [-75.343, 39.984]
   }
}'

pt2 <- '{
  "type": "Feature",
  "properties": {
     "marker-color": "#0f0"
   },
   "geometry": {
      "type": "Point",
      "coordinates": [-75.534, 39.123]
    }
}'
geo_distance(pt1, pt2)




