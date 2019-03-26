library(rmapshaper)


### Name: ms_erase
### Title: Remove features or portions of features that fall inside a
###   specified area
### Aliases: ms_erase

### ** Examples

library(geojsonio, quietly = TRUE)
library(sp)

points <- structure("{\"type\":\"FeatureCollection\",
  \"features\":[{\"type\":\"Feature\",\"properties\":{},
  \"geometry\":{\"type\":\"Point\",\"coordinates\":
  [52.8658,-44.7219]}},{\"type\":\"Feature\",\"properties\":{},
  \"geometry\":{\"type\":\"Point\",\"coordinates\":
  [53.7702,-40.4873]}},{\"type\":\"Feature\",\"properties\":{},
  \"geometry\":{\"type\":\"Point\",\"coordinates\":[55.3204,-37.5579]}},
  {\"type\":\"Feature\",\"properties\":{},\"geometry\":
  {\"type\":\"Point\",\"coordinates\":[56.2757,-37.917]}},
  {\"type\":\"Feature\",\"properties\":{},\"geometry\":
  {\"type\":\"Point\",\"coordinates\":[56.184,-40.6443]}},
  {\"type\":\"Feature\",\"properties\":{},\"geometry\":
  {\"type\":\"Point\",\"coordinates\":[61.0835,-40.7529]}},
  {\"type\":\"Feature\",\"properties\":{},\"geometry\":
  {\"type\":\"Point\",\"coordinates\":[58.0202,-43.634]}}]}",
  class = c("json", "geo_json"))
points <- geojson_sp(points)
plot(points)

erase_poly <- structure('{
"type": "Feature",
"properties": {},
"geometry": {
"type": "Polygon",
"coordinates": [
[
[51, -40],
[55, -40],
[55, -45],
[51, -45],
[51, -40]
]
]
}
}', class = c("json", "geo_json"))
erase_poly <- geojson_sp(erase_poly)

out <- ms_erase(points, erase_poly)
plot(out, add = TRUE)




