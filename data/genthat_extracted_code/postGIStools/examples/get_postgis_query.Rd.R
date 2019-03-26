library(postGIStools)


### Name: get_postgis_query
### Title: Send SELECT query and parse geometry, hstore columns
### Aliases: get_postgis_query

### ** Examples

## Not run: 
##D library(RPostgreSQL)
##D con <- dbConnect(PostgreSQL(), dbname = "my_db")
##D 
##D # If geom column holds points, returns a SpatialPointsDataFrame
##D cities <- get_postgis_query(con, "SELECT name, geom, datalist FROM city",
##D                             geom_name = "geom", hstore_name = "datalist")
##D 
##D # Get the populations (part of datalist hstore) as a vector
##D pop <- cities@data$datalist %->% "population"
## End(Not run)




