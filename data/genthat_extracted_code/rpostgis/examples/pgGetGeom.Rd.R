library(rpostgis)


### Name: pgGetGeom
### Title: Load a PostGIS geometry from a PostgreSQL table/view/query into
###   R.
### Aliases: pgGetGeom

### ** Examples

## Not run: 
##D ## Retrieve a Spatial*DataFrame with all data from table
##D ## 'schema.tablename', with geometry in the column 'geom'
##D pgGetGeom(conn, c("schema", "tablename"))
##D ## Return a Spatial*DataFrame with columns c1 & c2 as data
##D pgGetGeom(conn, c("schema", "tablename"), other.cols = c("c1","c2"))
##D ## Return a Spatial*-only (no data frame), 
##D ## retaining id from table as rownames
##D pgGetGeom(conn, c("schema", "tablename"), gid = "table_id",
##D   other.cols = FALSE)
##D ## Return a Spatial*-only (no data frame), 
##D ## retaining id from table as rownames and with a subset of the data
##D pgGetGeom(conn, c("schema", "roads"), geom = "roadgeom", gid = "road_ID",
##D     other.cols = FALSE, clauses  = "WHERE road_type = 'highway'")
##D ## Query mode
##D pgGetGeom(conn, query = "SELECT r.gid as id, ST_Buffer(r.geom, 100) as geom 
##D                            FROM
##D                              schema.roads r,
##D                              schema.adm_boundaries b
##D                            WHERE 
##D                              ST_Intersects(r.geom, b.geom);")
## End(Not run)



