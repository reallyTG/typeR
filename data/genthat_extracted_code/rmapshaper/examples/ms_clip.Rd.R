library(rmapshaper)


### Name: ms_clip
### Title: Remove features or portions of features that fall outside a
###   clipping area.
### Aliases: ms_clip

### ** Examples

library(geojsonio, quietly = TRUE)
library(sp)

poly <- structure("{\"type\":\"FeatureCollection\",
  \"features\":[{\"type\":\"Feature\",\"properties\":{},
  \"geometry\":{\"type\":\"Polygon\",\"coordinates\":
  [[[52.8658,-44.7219],[53.7702,-40.4873],[55.3204,-37.5579],
  [56.2757,-37.917],[56.184,-40.6443],[61.0835,-40.7529],
  [58.0202,-43.634],[61.6699,-45.0678],[62.737,-46.2841],
  [55.7763,-46.2637],[54.9742,-49.1184],[52.799,-45.9386],
  [52.0329,-49.5677],[50.1747,-52.1814],[49.0098,-52.3641],
  [52.7068,-45.7639],[43.2278,-47.1908],[48.4755,-45.1388],
  [50.327,-43.5207],[48.0804,-41.2784],[49.6307,-40.6159],
  [52.8658,-44.7219]]]}}]}", class = c("json", "geo_json"))
poly <- geojson_sp(poly)
plot(poly)

clip_poly <- structure('{
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
clip_poly <- geojson_sp(clip_poly)
plot(clip_poly)

out <- ms_clip(poly, clip_poly)
plot(out, add = TRUE)




