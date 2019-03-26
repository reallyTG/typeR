library(lawn)


### Name: lawn_dissolve
### Title: Dissolves a FeatureCollection of polygons based on a property.
###   Note that multipart features within the collection are not supported
### Aliases: lawn_dissolve

### ** Examples

cat(lawn_data$filter_features)
x <- '{
 "type": "FeatureCollection",
 "features": [
  {
    "type": "Feature",
    "properties": {
      "combine": "yes"
    },
    "geometry": {
      "type": "Polygon",
      "coordinates": [[[0, 0], [0, 1], [1, 1], [1, 0], [0, 0]]]
    }
  },
  {
    "type": "Feature",
    "properties": {
      "combine": "yes"
    },
    "geometry": {
      "type": "Polygon",
      "coordinates": [[[0, -1], [0, 0], [1, 0], [1, -1], [0,-1]]]
    }
  },
  {
    "type": "Feature",
    "properties": {
      "combine": "no"
    },
    "geometry": {
      "type": "Polygon",
      "coordinates": [[[1,-1],[1, 0], [2, 0], [2, -1], [1, -1]]]
    }
  }
  ]
}'
lawn_dissolve(x, key = 'combine')



