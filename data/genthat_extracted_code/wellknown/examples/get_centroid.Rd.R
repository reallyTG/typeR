library(wellknown)


### Name: get_centroid
### Title: Get a centroid from WKT or geojson
### Aliases: get_centroid

### ** Examples

# WKT
str <- "POINT (-116.4000000000000057 45.2000000000000028)"
get_centroid(str)
str <- 'MULTIPOINT ((100.000 3.101), (101.000 2.100), (3.140 2.180))'
get_centroid(str)
str <- "MULTIPOLYGON (((40 40, 20 45, 45 30, 40 40)),
 ((20 35, 45 20, 30 5, 10 10, 10 30, 20 35), (30 20, 20 25, 20 15, 30 20)))"
get_centroid(str)

# Geojson as geojson class
str <- "POINT (-116.4000000000000057 45.2000000000000028)"
get_centroid(wkt2geojson(str))
str <- 'MULTIPOINT ((100.000 3.101), (101.000 2.100), (3.140 2.180))'
get_centroid(wkt2geojson(str))
str <- "MULTIPOLYGON (((40 40, 20 45, 45 30, 40 40)),
 ((20 35, 45 20, 30 5, 10 10, 10 30, 20 35), (30 20, 20 25, 20 15, 30 20)))"
get_centroid(wkt2geojson(str))



