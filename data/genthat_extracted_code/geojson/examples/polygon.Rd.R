library(geojson)


### Name: polygon
### Title: polygon class
### Aliases: polygon

### ** Examples

x <- '{ "type": "Polygon",
"coordinates": [
  [ [100.0, 0.0], [100.0, 1.0], [101.0, 1.0], [101.0, 0.0], [100.0, 0.0] ]
  ]
}'
(y <- polygon(x))
y[1]
geo_type(y)
geo_pretty(y)
geo_write(y, f <- tempfile(fileext = ".geojson"))
jsonlite::fromJSON(f, FALSE)
unlink(f)

x <- '{ "type": "Polygon",
"coordinates": [
  [ [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0] ],
  [ [100.2, 0.2], [100.8, 0.2], [100.8, 0.8], [100.2, 0.8], [100.2, 0.2] ]
  ]
}'
(y <- polygon(x))
y[1]
geo_type(y)
geo_pretty(y)

# add to a data.frame
library('tibble')
tibble(a = 1:5, b = list(y))



