library(rmapshaper)


### Name: ms_explode
### Title: Convert multipart lines or polygons to singlepart
### Aliases: ms_explode

### ** Examples

library(geojsonio)
library(sp)

poly <- structure("{\"type\":\"FeatureCollection\",\"crs\":
          {\"type\":\"name\",\"properties\":{\"name\":
          \"urn:ogc:def:crs:OGC:1.3:CRS84\"}},\"features\":
          [\n{\"type\":\"Feature\",\"geometry\":{\"type\":
          \"MultiPolygon\",\"coordinates\":[[[[102,2],[102,3],
          [103,3],[103,2],[102,2]]],[[[100,0],[100,1],[101,1],
          [101,0],[100,0]]]]},\"properties\":{\"rmapshaperid\":0}}\n]}",
          class = c("json", "geo_json"))

poly <- geojson_sp(poly)
plot(poly)
length(poly)
poly@data

# Explode the polygon
out <- ms_explode(poly)
plot(out)
length(out)
out@data




