## ---- eval = F-----------------------------------------------------------
#  
#  library(GeoMongo)
#  
#  
#  # important : the property-names of each geojson object should be of type character string
#  
#  loc1 = '{
#            "name" : "Squaw Valley",
#            "location" : {
#                "type" : "Point",
#                "coordinates" : [
#                    -120.24,
#                    39.21
#                ]
#            }
#        }'
#  
#  
#  loc2 = '{
#          "name" : "Mammoth Lakes",
#          "location" : {
#              "type" : "Point",
#              "coordinates" : [
#                  -118.9,
#                  37.61
#              ]
#          }
#      }'
#  
#  
#  loc3 = '{
#          "name" : "Aspen",
#          "location" : {
#              "type" : "Point",
#              "coordinates" : [
#                  -106.82,
#                  39.18
#              ]
#          }
#      }'
#  
#  
#  loc4 = '{
#          "name" : "Whistler",
#          "location" : {
#              "type" : "Point",
#              "coordinates" : [
#                  -122.95,
#                  50.12
#              ]
#          }
#      }'
#  
#  
#  
#  # create a vector of character strings
#  
#  char_FILES = c(loc1, loc2, loc3, loc4)
#  

## ---- eval = F-----------------------------------------------------------
#  
#  init = geomongo$new(host = 'localhost', port = 27017)    # assuming MongoDB runs locally
#  
#  getter_client = init$getClient()                          # get MongoClient()
#  
#  init_db = getter_client[["example_db"]]                   # create a new database
#  
#  init_col = init_db$create_collection("example_col")       # create a new collection
#  

## ---- eval = F-----------------------------------------------------------
#  
#  init$geoInsert(DATA = char_FILES,              # input data
#  
#                 TYPE_DATA = 'dict_many',        # character vector of strings as input
#  
#                 COLLECTION = init_col,          # specify the relevant collection
#  
#                 GEOMETRY_NAME = "location")     # give the 'geometry name' of each geo-object
#  

## ---- eval = F-----------------------------------------------------------
#  
#  init_db$collection_names()    # prints out the collection names of the relevant database
#  

## ---- eval = F-----------------------------------------------------------
#  
#  "example_col"
#  

## ---- eval = F-----------------------------------------------------------
#  
#  init_col$find_one()          # prints one of the inserted geometry objects
#  

## ---- eval = F-----------------------------------------------------------
#  
#  $`_id`
#  5984a0b742b2563fb5838f6a
#  
#  $location
#  $location$type
#  [1] "Point"
#  
#  $location$coordinates
#  [1] -120.24   39.21
#  
#  
#  $name
#  [1] "Squaw Valley"
#  

## ---- eval = F-----------------------------------------------------------
#  
#  init_col$count()          # prints the number of the inserted geometry objects
#  

## ---- eval = F-----------------------------------------------------------
#  
#  [1] 4
#  

## ---- eval = F-----------------------------------------------------------
#  
#  {
#    "type": "Polygon",
#    "coordinates": [[
#      [-109, 41],
#      [-102, 41],
#      [-102, 37],
#      [-109, 37],
#      [-109, 41]
#    ]]
#  }
#  
#  

## ---- eval = F-----------------------------------------------------------
#  
#  db.locations.find({
#  ...   location: {
#  ...     $geoIntersects: {
#  ...       $geometry: {
#  ...         type: "Polygon",
#  ...         coordinates: [[
#  ...           [-109, 41],
#  ...           [-102, 41],
#  ...           [-102, 37],
#  ...           [-109, 37],
#  ...           [-109, 41]
#  ...         ]]
#  ...       }
#  ...     }
#  ...   }
#  ... })
#  

## ---- eval = F-----------------------------------------------------------
#  
#  query_geoIntersects = list('location' =
#  
#                               list('$geoIntersects' =
#  
#                                      list('$geometry' =
#  
#                                             list(
#  
#                                               type = "Polygon",
#  
#                                               coordinates =
#  
#                                                 list(
#  
#                                                   list(
#  
#                                                     c(-109, 41),
#  
#                                                     c(-102, 41),
#  
#                                                     c(-102, 37),
#  
#                                                     c(-109, 37),
#  
#                                                     c(-109, 41)
#                                                     )
#                                                   )
#                                               )
#                                           )
#                                    )
#                             )
#  
#  

## ---- eval = F-----------------------------------------------------------
#  
#  loc_intersect = init$geoQuery(QUERY = query_geoIntersects,      # query from previous chunk
#  
#                                METHOD = "find",                  # the method to use
#  
#                                COLLECTION = init_col,            # the collection to use
#  
#                                GEOMETRY_NAME = "location",       # the geometry name to use
#  
#                                TO_LIST = FALSE)                  # returns a data.table
#  
#  loc_intersect
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # data.table format
#  
#     location.type location.coordinates1 location.coordinates2  name                       id
#  1:         Point               -106.82                 39.18 Aspen 5984a0b742b2563fb5838f6c
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # MongoDB query
#  
#  db.locations.find({
#  ...   location: {
#  ...     $geoWithin: {
#  ...       $centerSphere: [[-122.5, 37.7], 300 / 3963.2]
#  ...     }
#  ...   }
#  ... })
#  

## ---- eval = F-----------------------------------------------------------
#  
#  geoWithin_sph = list('location' =
#  
#                         list('$geoWithin' =
#  
#                              list('$centerSphere' =
#  
#                                     list(
#  
#                                       c(-122.5, 37.7), 300 / 3963.2)
#                                   )
#                            )
#                     )
#  
#  
#  # no need to specify again the "COLLECTION" and "GEOMETRY_NAME" parameters
#  # as we use the same initialization of the R6 class with the previous query
#  
#  res_geoWithin_sph = init$geoQuery(QUERY = geoWithin_sph,
#  
#                                    METHOD = "find")
#  res_geoWithin_sph
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # example output
#  
#     location.type location.coordinates1 location.coordinates2
#  1:         Point               -118.90                 37.61
#  2:         Point               -120.24                 39.21
#  
#              name                       id
#     Mammoth Lakes 5984a0b742b2563fb5838f6b
#      Squaw Valley 5984a0b742b2563fb5838f6a
#  

## ---- eval = F-----------------------------------------------------------
#  
#  map_dat <- leaflet::leaflet()
#  
#  map_dat <- leaflet::addTiles(map_dat)
#  
#  map_dat <- leaflet::addMarkers(map_dat,
#  
#                                 lng = unlist(res_geoWithin_sph$location.coordinates1),
#  
#                                 lat = unlist(res_geoWithin_sph$location.coordinates2))
#  map_dat
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # MongoDB query
#  
#  db.locations.aggregate([{
#  ...   $geoNear: {
#  ...     near: {
#  ...       type: 'Point',
#  ...       coordinates: [-122.5, 37.1]
#  ...     },
#  ...     spherical: true,
#  ...     maxDistance: 900 * 1609.34,
#  ...     distanceMultiplier: 1 / 1609.34,
#  ...     distanceField: 'distanceFromSF'
#  ...   }
#  ... }])
#  

## ---- eval = F-----------------------------------------------------------
#  
#  query_geonear = list('$geoNear' =
#  
#                         list(near =
#  
#                                list(
#  
#                                  type = "Point",
#  
#                                  coordinates =
#  
#                                    c(-122.5, 37.1)
#  
#                                  ),
#  
#                              distanceField = "distanceFromSF",
#  
#                              maxDistance = 900 * 1609.34,
#  
#                              distanceMultiplier = 1 / 1609.34,
#  
#                              spherical = TRUE)
#                       )
#  
#  
#  func_quer_geonear = init$geoQuery(QUERY = query_geonear,
#  
#                                    METHOD = "aggregate")
#  func_quer_geonear
#  
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # example output
#  
#     distanceFromSF location.type location.coordinates1 location.coordinates2
#  1:       190.8044         Point               -120.24                 39.21
#  2:       201.0443         Point               -118.90                 37.61
#  3:       863.9478         Point               -106.82                 39.18
#  
#             name                           id
#     Squaw Valley     5984a0b742b2563fb5838f6a
#    Mammoth Lakes     5984a0b742b2563fb5838f6b
#            Aspen     5984a0b742b2563fb5838f6c
#  

## ---- eval = F-----------------------------------------------------------
#  
#  places_col = init_db$create_collection("places")       # create a new collection
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # important : the property-names of each geojson object should be of type character string
#  
#  place1 = '{
#            "name": "Central Park",
#            "location": { "type": "Point", "coordinates": [ -73.97, 40.77 ] },
#            "category": "Parks"
#            }'
#  
#  
#  place2 = '{
#           "name": "Sara D. Roosevelt Park",
#           "location": { "type": "Point", "coordinates": [ -73.9928, 40.7193 ] },
#           "category": "Parks"
#          }'
#  
#  
#  place3 = '{
#         "name": "Polo Grounds",
#         "location": { "type": "Point", "coordinates": [ -73.9375, 40.8303 ] },
#         "category": "Stadiums"
#          }'
#  
#  
#  # create a vector of character strings
#  
#  doc_FILES = c(place1, place2, place3)
#  

## ---- eval = F-----------------------------------------------------------
#  
#  
#  
#  init$geoInsert(DATA = doc_FILES,               # insert data
#  
#                 TYPE_DATA = 'dict_many',        # character vector of strings as input
#  
#                 COLLECTION = places_col,        # specify the relevant collection
#  
#                 GEOMETRY_NAME = "location")     # give the 'geometry name' of each geo-object
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # outputs the collection names
#  
#  init_db$collection_names()
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # example output
#  
#  [1] "places"      "example_col"
#  

## ---- eval = F-----------------------------------------------------------
#  
#  places_col$count()          # number of geojson objects in collection
#  

## ---- eval = F-----------------------------------------------------------
#  
#  [1] 3
#  

## ---- eval = F-----------------------------------------------------------
#  
#  db.runCommand(
#     {
#       geoNear: "places",
#       near: { type: "Point", coordinates: [ -73.9667, 40.78 ] },
#       spherical: true,
#       query: { category: "Parks" }
#     }
#  )
#  

## ---- eval = F-----------------------------------------------------------
#  
#  Args_Kwargs = list("geoNear", "places",
#  
#                     near = list("type" = "Point", "coordinates" = c(-73.9667, 40.78)),
#  
#                     spherical = TRUE,
#  
#                     query = list("category" = "Parks"))
#  

## ---- eval = F-----------------------------------------------------------
#  
#  init$geoQuery(QUERY = Args_Kwargs,
#  
#                METHOD = "command",
#  
#                COLLECTION = places_col,
#  
#                DATABASE = init_db,             # additionally I have to specify the database
#  
#                TO_LIST = FALSE)
#  
#  

## ---- eval = F-----------------------------------------------------------
#  
#     obj.category obj.location.type obj.location.coordinates1 obj.location.coordinates2
#  1:        Parks             Point                  -73.9700                   40.7700
#  2:        Parks             Point                  -73.9928                   40.7193
#  
#                   obj.name      dis                       id
#               Central Park 1147.422 5985b4d242b2563fb5838f6e
#     Sara D. Roosevelt Park 7106.506 5985b4d242b2563fb5838f6f
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # data taken from :  https://docs.mongodb.com/manual/tutorial/geospatial-tutorial/
#  
#  example_dat = '{"_id":
#                        {"$oid":"55cba2476c522cafdb053add"},
#                  "location":
#                        {"coordinates":[-73.856077,40.848447],"type":"Point"},
#                  "name":"Morris Park Bake Shop"}'
#  

## ---- eval = F-----------------------------------------------------------
#  
#  bson_col = init_db$create_collection("example_bson")       # create a new collection
#  

## ---- eval = F-----------------------------------------------------------
#  
#  init$geoInsert(DATA = example_dat,             # insert data
#  
#                TYPE_DATA = 'dict_one',          # single list as input
#  
#                COLLECTION = bson_col,           # specify the relevant collection
#  
#                GEOMETRY_NAME = "location",      # give the 'geometry name' of each geo-object
#  
#                read_method = "geojsonR")
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # example output
#  
#  Error in py_call_impl(callable, dots$args, dots$keywords) :
#    InvalidDocument: key '$oid' must not start with '$'
#  

## ---- eval = F-----------------------------------------------------------
#  
#  init$geoInsert(DATA = example_dat,             # insert data
#  
#                TYPE_DATA = 'dict_one',          # single character string as input
#  
#                COLLECTION = bson_col,           # specify the relevant collection
#  
#                GEOMETRY_NAME = "location",      # give the 'geometry name' of each geo-object
#  
#                read_method = "mongo_bson")
#  

## ---- eval = F-----------------------------------------------------------
#  
#  bson_col$count()
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # example output
#  
#  [1] 1
#  

## ---- eval = F-----------------------------------------------------------
#  
#  bson_col$find_one()
#  

## ---- eval = F-----------------------------------------------------------
#  
#  # example output
#  
#  $`_id`
#  55cba2476c522cafdb053add
#  
#  $location
#  $location$type
#  [1] "Point"
#  
#  $location$coordinates
#  [1] -73.85608  40.84845
#  
#  
#  $name
#  [1] "Morris Park Bake Shop"
#  

