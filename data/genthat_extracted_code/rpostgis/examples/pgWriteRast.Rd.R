library(rpostgis)


### Name: pgWriteRast
### Title: Write raster to PostGIS database table.
### Aliases: pgWriteRast

### ** Examples

## Not run: 
##D pgWriteRast(conn, c("schema", "tablename"), raster_name)
##D 
##D # basic test
##D r <- raster::raster(nrows=180, ncols=360, xmn=-180, xmx=180,
##D     ymn=-90, ymx=90, vals=1)
##D pgWriteRast(conn, c("schema", "test"), raster = r,
##D     bit.depth = "2BUI", overwrite = TRUE)
## End(Not run)



