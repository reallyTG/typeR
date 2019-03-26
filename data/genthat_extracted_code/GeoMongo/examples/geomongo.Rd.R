library(GeoMongo)


### Name: geomongo
### Title: mongodb geospatial methods ( using PyMongo in R )
### Aliases: geomongo
### Keywords: datasets

### ** Examples


## Not run: 
##D library(GeoMongo)
##D 
##D init = geomongo$new()
##D 
##D getter_client = init$getClient()
##D 
##D init_db = getter_client$get_database("example_db")
##D 
##D init_col = init_db$get_collection("example_collection")
##D 
##D #--------------------------
##D # geonear using 'aggregate'
##D #--------------------------
##D 
##D query_geonear = list('$geoNear' = list(near = list(type = "Point", coordinates = c(-122.5, 37.1)),
##D 
##D                      distanceField = "distance", maxDistance = 900 * 1609.34,
##D 
##D                      distanceMultiplier = 1 / 1609.34, spherical = TRUE))
##D 
##D 
##D init$geoQuery(QUERY = query_geonear, METHOD = "aggregate", COLLECTION = init_col,
##D 
##D               DATABASE = init_db, GEOMETRY_NAME = "location", TO_LIST = FALSE)
## End(Not run)



