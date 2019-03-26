library(rpostgis)


### Name: pgInsert
### Title: Inserts data into a PostgreSQL table.
### Aliases: pgInsert print.pgi

### ** Examples

## Not run: 
##D library(sp)
##D data(meuse)
##D coords <- SpatialPoints(meuse[, c("x", "y")])
##D spdf <- SpatialPointsDataFrame(coords, meuse)
##D 
##D ## Insert data in new database table
##D pgInsert(conn, name = c("public", "meuse_data"), data.obj = spdf)
##D 
##D ## The same command will insert into already created table (if all R
##D ## columns match)
##D pgInsert(conn, name = c("public", "meuse_data"), data.obj = spdf)
##D 
##D ## If not all database columns match, need to use partial.match = TRUE,
##D ## where non-matching columns are not inserted
##D colnames(spdf@data)[4] <- "cu"
##D pgInsert(conn, name = c("public", "meuse_data"), data.obj = spdf,
##D     partial.match = TRUE)
## End(Not run)



