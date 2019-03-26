library(wellknown)


### Name: as_json
### Title: Convert geojson R list to JSON
### Aliases: as_json

### ** Examples

str <- "POLYGON ((100 0.1, 101.1 0.3, 101 0.5, 100 0.1),
   (103.2 0.2, 104.8 0.2, 100.8 0.8, 103.2 0.2))"
as_json(wkt2geojson(str))
as_json(wkt2geojson(str), FALSE)



