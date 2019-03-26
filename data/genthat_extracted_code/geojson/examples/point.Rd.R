library(geojson)


### Name: point
### Title: point class
### Aliases: point

### ** Examples

x <- '{ "type": "Point", "coordinates": [100.0, 0.0] }'
(y <- point(x))
geo_type(y)
geo_pretty(y)
geo_write(y, f <- tempfile(fileext = ".geojson"))
jsonlite::fromJSON(f, FALSE)
unlink(f)

# add to a data.frame
library('tibble')
tibble(a = 1:5, b = list(y))

# as.geojson coercion
as.geojson(x)



