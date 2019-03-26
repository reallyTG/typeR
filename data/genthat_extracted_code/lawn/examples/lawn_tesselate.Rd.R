library(lawn)


### Name: lawn_tesselate
### Title: Tesselate
### Aliases: lawn_tesselate

### ** Examples

poly <- '{
 "type": "Feature",
  "properties": {
    "fill": "#0f0"
  },
  "geometry": {
    "type": "Polygon",
    "coordinates": [[
      [-46.738586, -23.596711],
      [-46.738586, -23.458207],
      [-46.560058, -23.458207],
      [-46.560058, -23.596711],
      [-46.738586, -23.596711]
    ]]
  }
}'
lawn_tesselate(poly)

xx <- jsonlite::fromJSON(lawn_data$polygons_within, FALSE)
lawn_tesselate(xx$features[[1]])
## Not run: 
##D lawn_tesselate(xx$features[[1]]) %>% view
##D lawn_tesselate(poly) %>% view
## End(Not run)



