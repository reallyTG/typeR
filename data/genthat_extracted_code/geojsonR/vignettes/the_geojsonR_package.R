## ---- eval = F-----------------------------------------------------------
#  
#  {
#      "type": "FeatureCollection",
#      "features": [{
#  
#          "type": "Feature",
#           "geometry": {
#               "type": "Point",
#               "coordinates":
#                  [102.0, 0.5]
#           },
#           "properties": {
#           "prop0": "value0"
#           }
#          }, {
#  
#             "type": "Feature",
#             "geometry": {
#                 "type": "LineString",
#                 "coordinates": [
#                   [102.0, 0.0],
#                   [103.0, 1.0],
#                   [104.0, 0.0],
#                   [102.0, 0.0]
#                   ]
#                 },
#                 "properties": {
#                  "prop0": "value0",
#                  "prop1": 0.0
#                 }
#          }
#      ]
#  }
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # assuming that the data is saved in the previously mentioned "feature_collection.geojson"
#  
#  library(geojsonR)
#  
#  # INPUT IS A PATH TO A FILE
#  
#  file_js = FROM_GeoJson(url_file_string = "feature_collection.geojson")
#  
#  file_js
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # output :
#  
#  
#  $features
#  $features[[1]]
#  $features[[1]]$geometry
#  $features[[1]]$geometry$type
#  [1] "Point"
#  
#  $features[[1]]$geometry$coordinates
#       [,1] [,2]
#  [1,]  102  0.5
#  
#  
#  $features[[1]]$properties
#  $features[[1]]$properties$prop0
#  [1] "value0"
#  
#  
#  $features[[1]]$type
#  [1] "Feature"
#  
#  
#  $features[[2]]
#  $features[[2]]$geometry
#  $features[[2]]$geometry$type
#  [1] "LineString"
#  
#  $features[[2]]$geometry$coordinates
#       [,1] [,2]
#  [1,]  102    0
#  [2,]  103    1
#  [3,]  104    0
#  [4,]  102    0
#  
#  
#  $features[[2]]$properties
#  $features[[2]]$properties$prop0
#  [1] "value0"
#  
#  $features[[2]]$properties$prop1
#  [1] 0
#  
#  
#  $features[[2]]$type
#  [1] "Feature"
#  
#  
#  
#  $type
#  [1] "FeatureCollection"
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # INPUT IS A GeoJson OBJECT (character string)
#  
#  str_js = '{ "type": "MultiPolygon",
#              "coordinates": [
#                  [[[102.0, 2.0], [103.0, 2.0], [103.0, 3.0], [102.0, 3.0], [102.0, 2.0]]],
#                  [[[100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0]],
#                   [[100.2, 0.2], [100.8, 0.2], [100.8, 0.8], [100.2, 0.8], [100.2, 0.2]]]
#                  ]
#  }'
#  
#  
#  char_js = FROM_GeoJson(url_file_string = str_js)
#  
#  char_js
#  

## ---- eval = F-----------------------------------------------------------
#  
#  $type
#  [1] "MultiPolygon"
#  
#  $coordinates
#  $coordinates[[1]]
#       [,1] [,2]
#  [1,]  102    2
#  [2,]  103    2
#  [3,]  103    3
#  [4,]  102    3
#  [5,]  102    2
#  
#  $coordinates[[2]]
#  $coordinates[[2]][[1]]
#       [,1] [,2]
#  [1,]  100    0
#  [2,]  101    0
#  [3,]  101    1
#  [4,]  100    1
#  [5,]  100    0
#  
#  $coordinates[[2]][[2]]
#        [,1] [,2]
#  [1,] 100.2  0.2
#  [2,] 100.8  0.2
#  [3,] 100.8  0.8
#  [4,] 100.2  0.8
#  [5,] 100.2  0.2
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # INPUT IS A URL (beginning from http..)
#  
#  url_path = "https://raw.githubusercontent.com/mlampros/DataSets/master/california.geojson"
#  
#  url_js = FROM_GeoJson(url_file_string = url_path)
#  
#  str(url_js)
#  
#  Warning message:
#  closing unused connection 3 (https://raw.githubusercontent.com/mlampros/DataSets/master/california.geojson)
#  

## ---- eval = F-----------------------------------------------------------
#  
#  List of 4
#   $ geometry  :List of 2
#    ..$ type       : chr "MultiPolygon"
#    ..$ coordinates:List of 11
#    .. ..$ : num [1:56, 1:2] -120 -120 -120 -120 -120 ...
#    .. ..$ : num [1:64, 1:2] -120 -120 -120 -120 -120 ...
#    .. ..$ : num [1:36, 1:2] -120 -120 -120 -120 -120 ...
#    .. ..$ : num [1:24, 1:2] -120 -120 -120 -120 -119 ...
#    .. ..$ : num [1:16, 1:2] -119 -119 -119 -119 -119 ...
#    .. ..$ : num [1:42, 1:2] -119 -119 -119 -119 -119 ...
#    .. ..$ : num [1:48, 1:2] -119 -118 -118 -118 -118 ...
#    .. ..$ : num [1:11, 1:2] -122 -122 -122 -122 -122 ...
#    .. ..$ : num [1:11, 1:2] -123 -123 -123 -123 -123 ...
#    .. ..$ : num [1:9, 1:2] -122 -122 -122 -122 -122 ...
#    .. ..$ : num [1:1154, 1:2] -124 -124 -124 -124 -124 ...
#   $ id        : chr "california"
#   $ properties:List of 11
#    ..$ abbreviation: chr "CA"
#    ..$ area        : num 423968
#    ..$ capital     : chr "Sacramento"
#    ..$ city        : chr "Los Angeles"
#    ..$ group       : chr "US States"
#    ..$ houseseats  : num 53
#    ..$ landarea    : num 403466
#    ..$ name        : chr "California"
#    ..$ population  : num 38332521
#    ..$ statehood   : chr "1850-09-09"
#    ..$ waterarea   : num 20502
#   $ type      : chr "Feature"
#  

## ---- eval = F-----------------------------------------------------------
#  
#  init = TO_GeoJson$new()
#  
#  polygon_WITH_dat = list(list(c(100, 1.01), c(200, 2.01), c(100, 1.0), c(100, 1.01)),
#  
#                          list(c(50, 0.5), c(50, 0.8), c(50, 0.9), c(50, 0.5)))
#  
#  polygon_with = init$Polygon(polygon_WITH_dat, stringify = TRUE)
#  
#  str(polygon_with)
#  

## ---- eval = F-----------------------------------------------------------
#  
#  List of 3
#   $ json_dump  : chr "{\"coordinates\": [[[100, 1.01], [200, 2.0099999999999998], [100, 1], [100, 1.01]], [[50, 0.5], [50, 0.80000000000000004], [50,"| __truncated__
#   $ type       : chr "Polygon"
#   $ coordinates:List of 2
#    ..$ :List of 4
#    .. ..$ : num [1:2] 100 1.01
#    .. ..$ : num [1:2] 200 2.01
#    .. ..$ : num [1:2] 100 1
#    .. ..$ : num [1:2] 100 1.01
#    ..$ :List of 4
#    .. ..$ : num [1:2] 50 0.5
#    .. ..$ : num [1:2] 50 0.8
#    .. ..$ : num [1:2] 50 0.9
#    .. ..$ : num [1:2] 50 0.5
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # if "stringify = TRUE"
#  
#  cat(polygon_with$json_dump)
#  
#  {"coordinates": [[[100, 1.01], [200, 2.0099999999999998], [100, 1], [100, 1.01]], [[50, 0.5], [50, 0.80000000000000004], [50, 0.90000000000000002], [50, 0.5]]], "type": "Polygon"}
#  

## ---- eval = F-----------------------------------------------------------
#  
#  dump_js = Dump_From_GeoJson(url_file = "feature_collection.geojson")
#  
#  cat(dump_js)
#  

## ---- eval = F-----------------------------------------------------------
#  
#  {"features": [{"geometry": {"coordinates": [102, 0.5], "type": "Point"}, "properties": {"prop0": "value0"}, "type": "Feature"}, {"geometry": {"coordinates": [[102, 0], [103, 1], [104, 0], [105, 1]], "type": "LineString"}, "properties": {"prop0": "value0", "prop1": 0}, "type": "Feature"}], "type": "FeatureCollection"}
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # "Feature1.geojson"
#  
#  {
#   "type": "Feature",
#  
#   "id": 1,
#  
#   "bbox": [-10.0, -10.0, 10.0, 10.0],
#  
#   "geometry": {
#  
#      "type": "Polygon",
#  
#      "coordinates": [
#  
#           [
#              [-10.0, -10.0], [10.0, -10.0], [10.0, 10.0], [-10.0, -10.0]
#           ]
#        ]
#      },
#  
#      "properties": {
#  
#        "prop_1": "addr1",
#  
#        "prop_2": 1
#      }
#  }
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # "Feature2.geojson"
#  
#  {
#   "type": "Feature",
#  
#   "id": 2,
#  
#   "bbox": [-10.0, -10.0, 10.0, 10.0],
#  
#   "geometry": {
#  
#      "type": "Polygon",
#  
#      "coordinates": [
#  
#           [
#              [-10.0, -10.0], [10.0, -10.0], [10.0, 10.0], [-10.0, -10.0]
#           ]
#        ]
#      },
#  
#      "properties": {
#  
#        "prop_1": "addr2",
#  
#        "prop_2": 2
#      }
#  }
#  

## ---- eval = F-----------------------------------------------------------
#  
#  vec_in = c("Feature1.geojson", "Feature2.geojson")
#  
#  res_fcol = Features_2Collection(vec_in, bbox_vec = NULL)
#  
#  cat(res_fcol)
#  

## ---- eval = F-----------------------------------------------------------
#  
#  {"bbox": [], "features": [{"bbox": [-10, -10, 10, 10], "geometry": {"coordinates": [[[-10, -10], [10, -10], [10, 10], [-10, -10]]], "type": "Polygon"}, "id": 1, "properties": {"prop_1": "addr1", "prop_2": 1}, "type": "Feature"}, {"bbox": [-10, -10, 10, 10], "geometry": {"coordinates": [[[-10, -10], [10, -10], [10, 10], [-10, -10]]], "type": "Polygon"}, "id": 2, "properties": {"prop_1": "addr2", "prop_2": 2}, "type": "Feature"}], "type": "FeatureCollection"}
#  

