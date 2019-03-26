library(rmapshaper)


### Name: ms_filter_fields
### Title: Delete fields in the attribute table
### Aliases: ms_filter_fields

### ** Examples

library(geojsonio)
library(sp)

poly <- structure("{\"type\":\"FeatureCollection\",
                  \"features\":[{\"type\":\"Feature\",
                  \"properties\":{\"a\": 1, \"b\":2, \"c\": 3},
                  \"geometry\":{\"type\":\"Polygon\",
                  \"coordinates\":[[[102,2],[102,4],[104,4],[104,2],[102,2]]]}}]}",
                  class = c("json", "geo_json"))
poly <- geojson_sp(poly)
poly@data

# Filter (keep) fields a and b, drop c
out <- ms_filter_fields(poly, c("a", "b"))
out@data




