library(lawn)


### Name: lawn_polygonize
### Title: Polygonizes multi-linestring's to polygons
### Aliases: lawn_polygonize
### Keywords: internal

### ** Examples

## Not run: 
##D  # line <- '{
##D  #   "type": "FeatureCollection",
##D  #   "features": [
##D  #     {
##D  #      "type": "Feature",
##D  #      "properties": {
##D  #        "stroke": "#F00"
##D  #     },
##D  #      "geometry": {
##D  #        "type": "LineString",
##D  #        "coordinates": [[-83, 30], [-84, 36], [-78, 41]]
##D  #      }
##D  #    },
##D  #     {
##D  #      "type": "Feature",
##D  #      "properties": {
##D  #        "stroke": "#F00"
##D  #     },
##D  #      "geometry": {
##D  #        "type": "LineString",
##D  #        "coordinates": [[-86, 34], [-88, 33], [-73, 39]]
##D  #      }
##D  #    }
##D  #  ]
##D  # }'
##D  #
##D  # line <- '{
##D  #   "type": "FeatureCollection",
##D  #   "features": [
##D  #     {
##D  #      "type": "Feature",
##D  #      "geometry": {
##D  #        "type": "LineString",
##D  #        "coordinates": [[0, 0], [1, 1]]
##D  #      }
##D  #    },
##D  #     {
##D  #      "type": "Feature",
##D  #      "geometry": {
##D  #        "type": "LineString",
##D  #        "coordinates": [[1, 1], [-1, -1]]
##D  #      }
##D  #    },
##D  #     {
##D  #      "type": "Feature",
##D  #      "geometry": {
##D  #        "type": "LineString",
##D  #        "coordinates": [[-1, -1], [0, 0]]
##D  #      }
##D  #    }
##D  #  ]
##D  # }'
##D 
##D 
##D  # x <- '{
##D  #   "type": "FeatureCollection",
##D  #   "features": [
##D  #     {
##D  #       "type": "Feature",
##D  #       "properties": {},
##D  #       "geometry": {
##D  #         "type": "LineString",
##D  #         "coordinates": [
##D  #           [
##D  #             119.00390625,
##D  #             -22.024545601240337
##D  #           ],
##D  #           [
##D  #             120.58593749999999,
##D  #             -28.613459424004414
##D  #           ],
##D  #           [
##D  #             125.595703125,
##D  #             -32.99023555965107
##D  #           ],
##D  #           [
##D  #             133.330078125,
##D  #             -32.99023555965107
##D  #           ],
##D  #           [
##D  #             142.646484375,
##D  #             -30.977609093348676
##D  #           ],
##D  #           [
##D  #             142.294921875,
##D  #             -24.126701958681668
##D  #           ],
##D  #           [
##D  #             139.04296875,
##D  #             -16.299051014581817
##D  #           ],
##D  #           [
##D  #             128.84765625,
##D  #             -15.199386048559994
##D  #           ]
##D  #         ]
##D  #       }
##D  #     },
##D  #     {
##D  #       "type": "Feature",
##D  #       "properties": {},
##D  #       "geometry": {
##D  #         "type": "LineString",
##D  #         "coordinates": [
##D  #           [
##D  #             142.646484375,
##D  #             -30.977609093348676
##D  #           ],
##D  #           [
##D  #             132.451171875,
##D  #             -27.449790329784214
##D  #           ],
##D  #           [
##D  #             128.671875,
##D  #             -23.1605633090483
##D  #           ],
##D  #           [
##D  #             119.00390625,
##D  #             -22.024545601240337
##D  #           ]
##D  #         ]
##D  #       }
##D  #     }
##D  #   ]
##D  # }'
##D  # lawn_polygonize(lines = x)
## End(Not run)



