library(rpostgis)


### Name: pgGetPts
### Title: Load a PostGIS point geometry from a PostgreSQL table/view into
###   R.
### Aliases: pgGetPts
### Keywords: internal

### ** Examples

## Not run: 
##D ## Retrieve a SpatialPointsDataFrame with all data from table
##D ## 'schema.tablename', with geometry in the column 'geom'
##D pgGetPts(conn, c("schema", "tablename"))
##D ## Return a SpatialPointsDataFrame with columns c1 & c2 as data
##D pgGetPts(conn, c("schema", "tablename"), other.cols = "c1,c2")
##D ## Return a SpatialPoints, retaining id from table as rownames
##D pgGetPts(conn, c("schema", "tablename"), gid = "table_id", other.cols = FALSE)
## End(Not run)



