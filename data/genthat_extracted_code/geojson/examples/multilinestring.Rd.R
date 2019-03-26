library(geojson)


### Name: multilinestring
### Title: multilinestring class
### Aliases: multilinestring

### ** Examples

x <- '{ "type": "MultiLineString",
 "coordinates": [ [ [100.0, 0.0], [101.0, 1.0] ], [ [102.0, 2.0], [103.0, 3.0] ] ] }'
(y <- multilinestring(x))
y[1]
geo_type(y)
geo_pretty(y)
geo_write(y, f <- tempfile(fileext = ".geojson"))
jsonlite::fromJSON(f, FALSE)
unlink(f)

file <- system.file("examples", 'multilinestring_one.geojson', 
  package = "geojson")
con <- file(file)
str <- paste0(readLines(con), collapse = " ")
(y <- multilinestring(str))
y[1]
geo_type(y)
geo_pretty(y)
close(con)

# add to a data.frame
library('tibble')
tibble(a = 1:5, b = list(y))



