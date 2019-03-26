library(geojson)


### Name: geo_bbox
### Title: Calculate a bounding box
### Aliases: geo_bbox

### ** Examples

# point
x <- '{ "type": "Point", "coordinates": [100.0, 0.0] }'
(y <- point(x))
geo_bbox(y)
y %>% feature() %>% geo_bbox()

# multipoint
x <- '{"type": "MultiPoint", "coordinates": [ [100.0, 0.0], [101.0, 1.0] ] }'
(y <- multipoint(x))
geo_bbox(y)
y %>% feature() %>% geo_bbox()

# linestring
x <- '{ "type": "LineString", "coordinates": [ [100.0, 0.0], [101.0, 1.0] ]}'
(y <- linestring(x))
geo_bbox(y)
y %>% feature() %>% geo_bbox()
file <- system.file("examples", 'linestring_one.geojson',
  package = "geojson")
con <- file(file)
str <- paste0(readLines(con), collapse = " ")
(y <- linestring(str))
geo_bbox(y)
y %>% feature() %>% geo_bbox()
close(con)

# multilinestring
x <- '{ "type": "MultiLineString",
 "coordinates": [ [ [100.0, 0.0], [101.0, 1.0] ], [ [102.0, 2.0],
 [103.0, 3.0] ] ] }'
(y <- multilinestring(x))
geo_bbox(y)
y %>% feature() %>% geo_bbox()

# polygon
x <- '{ "type": "Polygon",
"coordinates": [
  [ [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0] ]
  ]
}'
(y <- polygon(x))
geo_bbox(y)
y %>% feature() %>% geo_bbox()

# multipolygon
x <- '{ "type": "MultiPolygon",
"coordinates": [
  [[[102.0, 2.0], [103.0, 2.0], [103.0, 3.0], [102.0, 3.0], [102.0, 2.0]]],
  [[[100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0]],
  [[100.2, 0.2], [100.8, 0.2], [100.8, 0.8], [100.2, 0.8], [100.2, 0.2]]]
  ]
}'
(y <- multipolygon(x))
geo_bbox(y)
y %>% feature() %>% geo_bbox()

# featurecollection
file <- system.file("examples", 'featurecollection2.geojson',
  package = "geojson")
str <- paste0(readLines(file), collapse = " ")
x <- featurecollection(str)
geo_bbox(x)

# character
file <- system.file("examples", 'featurecollection2.geojson',
  package = "geojson")
str <- paste0(readLines(file), collapse = " ")
geo_bbox(str)

# json
library('jsonlite')
geo_bbox(toJSON(fromJSON(str), auto_unbox = TRUE))



