library(lawn)


### Name: lawn_unkinkpolygon
### Title: Unkink polygon
### Aliases: lawn_unkinkpolygon

### ** Examples

x <- '{
  "type": "Feature",
  "properties": {},
  "geometry": {
    "type": "Polygon",
      "coordinates": [[[0, 0], [2, 0], [0, 2], [2, 2], [0, 0]]]
   }
}'
lawn_unkinkpolygon(x)
view(x)
view(lawn_unkinkpolygon(x))



