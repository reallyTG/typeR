library(wellknown)


### Name: properties
### Title: Add properties to a GeoJSON object
### Aliases: properties

### ** Examples

str <- "POINT (-116.4000000000000057 45.2000000000000028)"
x <- wkt2geojson(str)
properties(x, style = list(color = "red"))



