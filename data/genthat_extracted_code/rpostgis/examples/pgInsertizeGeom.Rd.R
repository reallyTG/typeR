library(rpostgis)


### Name: pgInsertizeGeom
### Title: Format R data objects for insert into a PostgreSQL table.
### Aliases: pgInsertizeGeom pgInsertize
### Keywords: internal

### ** Examples

## Not run: 
##D library(sp)
##D data(meuse)
##D coords <- SpatialPoints(meuse[, c("x", "y")])
##D spdf <- SpatialPointsDataFrame(coords, meuse)
##D 
##D ## Format data for insert
##D pgi.new <- pgInsertizeGeom(spdf, geom = "point_geom", create.table = c("schema",
##D     "table"), new.id = "pt_gid")
##D print(pgi.new)
##D 
##D ## Insert data in database table (note that an error will be given if
##D ## all insert columns do not have exactly matching database table
##D ## columns)
##D pgInsert(conn = conn, data.obj = pgi.new)
##D 
##D ## Inserting into existing table
##D pgi.existing <- pgInsertizeGeom(spdf, geom = "point_geom", force.match = c("schema",
##D     "table"), conn = conn)
##D ## A warning message is given, since the "dist.m" column is not found
##D ## in the database table (it was changed to "dist_m" in pgi.new to
##D ## make name DB-compliant). All other columns are prepared for insert.
##D print(pgi.existing)
##D 
##D pgInsert(conn = conn, data.obj = pgi.existing)
## End(Not run)
## Not run: 
##D ## Format regular (non-spatial) data frame for insert using
##D ## pgInsertize connect to database
##D data <- data.frame(a = c(1, 2, 3), b = c(4, NA, 6), c = c(7,
##D     "text", 9))
##D 
##D ## Format non-spatial data frame for insert
##D values <- pgInsertize(data.obj = data)
##D 
##D ## Insert data in database table (note that an error will be given if
##D ## all insert columns do not match exactly to database table columns)
##D pgInsert(conn, data.obj = values, name = c("schema", "table"))
##D 
##D ## Run with forced matching of database table column names
##D values <- pgInsertize(data.obj = data, force.match = c("schema",
##D     "table"), conn = conn)
##D 
##D pgInsert(conn, data.obj = values)
## End(Not run)



