library(geojson)


### Name: crs
### Title: Add or get CRS
### Aliases: crs crs_add crs_get

### ** Examples

x <- '{ "type": "Polygon",
"coordinates": [
  [ [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0] ]
  ]
}'

# add crs
crs <- '{"type": "name",
 "properties": {
     "name": "urn:ogc:def:crs:OGC:1.3:CRS84"
}}'
x %>% feature() %>% crs_add(crs)

# get crs
z <- x %>% feature() %>% crs_add(crs)
crs_get(z)



