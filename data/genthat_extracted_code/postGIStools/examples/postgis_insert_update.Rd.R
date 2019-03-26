library(postGIStools)


### Name: postgis_insert
### Title: Insert or update records in a PostgreSQL table from a R data
###   frame.
### Aliases: postgis_insert postgis_update

### ** Examples

## Not run: 
##D library(RPostgreSQL)
##D con <- dbConnect(PostgreSQL(), dbname = "my_db")
##D 
##D # Returns a SpatialPointsDataFrame
##D cities <- get_postgis_query(con, "SELECT name, geom, datalist FROM city",
##D                             geom_name = "geom", hstore_name = "datalist")
##D 
##D # Create a new field in hstore and update DB
##D cities@data$datalist %->% "pop_density" <-
##D    cities@data$datalist %->% "population" / cities@data$datalist %->% "area"
##D postgis_update(con, cities, "city",
##D                id_cols = "name", update_cols = "datalist",
##D                geom_name = "geom", hstore_name = "datalist")
##D 
##D # Add rows to DB with postgis_insert
##D # (new_cities is a SpatialPointsDataFrame with same columns as cities)
##D postgis_insert(con, new_cities, "city",
##D                geom_name = "geom", hstore_name = "datalist")
## End(Not run)




