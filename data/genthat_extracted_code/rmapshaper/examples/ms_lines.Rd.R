library(rmapshaper)


### Name: ms_lines
### Title: Convert polygons to topological boundaries (lines)
### Aliases: ms_lines

### ** Examples


library(geojsonio)
library(sp)

poly <- structure('{"type":"FeatureCollection",
             "features":[
             {"type":"Feature",
             "properties":{"foo": "a"},
             "geometry":{"type":"Polygon","coordinates":[[
             [102,2],[102,3],[103,3],[103,2],[102,2]
             ]]}}
             ,{"type":"Feature",
             "properties":{"foo": "a"},
             "geometry":{"type":"Polygon","coordinates":[[
             [103,3],[104,3],[104,2],[103,2],[103,3]
             ]]}},
             {"type":"Feature",
             "properties":{"foo": "b"},
             "geometry":{"type":"Polygon","coordinates":[[
             [102.5,1],[102.5,2],[103.5,2],[103.5,1],[102.5,1]
             ]]}}]}', class = c("json", "geo_json"))

poly <- geojson_sp(poly)
summary(poly)
plot(poly)

out <- ms_lines(poly)
summary(out)
plot(out)




