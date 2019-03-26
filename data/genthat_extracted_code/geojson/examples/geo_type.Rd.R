library(geojson)


### Name: geo_type
### Title: Get geometry type
### Aliases: geo_type

### ** Examples

geo_type(point('{ "type": "Point", "coordinates": [100.0, 0.0] }'))

x <- '{ "type": "Polygon",
"coordinates": [
  [ [100.0, 0.0], [100.0, 1.0], [101.0, 1.0], [101.0, 0.0], [100.0, 0.0] ]
  ]
}'
poly <- polygon(x)

geo_type(poly)



