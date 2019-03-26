library(rmapshaper)


### Name: ms_innerlines
### Title: Create a line layer consisting of shared boundaries with no
###   attribute data
### Aliases: ms_innerlines

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
                  [102,1],[102,2],[103,2],[103,1],[102,1]
                  ]]}},
              {"type":"Feature",
                "properties":{"foo": "b"},
                "geometry":{"type":"Polygon","coordinates":[[
                  [103,1],[103,2],[104,2],[104,1],[103,1]
                  ]]}}]}', class = c("json", "geo_json"))

poly <- geojson_sp(poly)
plot(poly)

out <- ms_innerlines(poly)
plot(out)




