library(geojson)


### Name: geo_pretty
### Title: Pretty print geojson
### Aliases: geo_pretty

### ** Examples

geo_pretty(point('{ "type": "Point", "coordinates": [100.0, 0.0] }'))

x <- '{ "type": "Polygon",
"coordinates": [
  [ [100.0, 0.0], [100.0, 1.0], [101.0, 1.0], [101.0, 0.0], [100.0, 0.0] ]
  ]
}'
poly <- polygon(x)
geo_pretty(poly)



