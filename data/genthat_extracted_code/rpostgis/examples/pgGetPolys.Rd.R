library(rpostgis)


### Name: pgGetPolys
### Title: Load a PostGIS polygon geometry from a PostgreSQL table/view
###   into R.
### Aliases: pgGetPolys
### Keywords: internal

### ** Examples

## Not run: 
##D pgGetPolys(conn, c("schema", "tablename"))
##D pgGetPolys(conn, c("schema", "states"), geom = "statesgeom",
##D     gid = "state_ID", other.cols = "area,population",
##D     clauses  = "WHERE area > 1000000 ORDER BY population LIMIT 10")
## End(Not run)



