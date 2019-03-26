library(rpostgis)


### Name: pgGetLines
### Title: Load a PostGIS linestring geometry from a PostgreSQL table/view
###   into R.
### Aliases: pgGetLines
### Keywords: internal

### ** Examples

## Not run: 
##D pgGetLines(conn, c("schema", "tablename"))
##D pgGetLines(conn, c("schema", "roads"), geom = "roadgeom", gid = "road_ID",
##D     other.cols = NULL, clauses  = "WHERE field = 'highway'")
## End(Not run)



