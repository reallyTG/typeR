library(geoops)


### Name: geo_destination
### Title: Calculate a destination
### Aliases: geo_destination

### ** Examples

point <- '{
  "type": "Feature",
  "properties": {
    "marker-color": "#0f0"
   },
   "geometry": {
      "type": "Point",
      "coordinates": [-75.343, 39.984]
   }
}'
geo_destination(point, 50, 90, 'miles')
geo_destination(point, 200, 90)



