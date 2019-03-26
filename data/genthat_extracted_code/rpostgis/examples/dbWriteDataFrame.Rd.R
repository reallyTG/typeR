library(rpostgis)


### Name: dbWriteDataFrame
### Title: Write/read in data frame mode to/from database table.
### Aliases: dbWriteDataFrame dbWriteDF dbReadDataFrame dbReadDF

### ** Examples

## Not run: 
##D library(sp)
##D data(meuse)
##D 
##D ## Write the data.frame to the database:
##D dbWriteDataFrame(conn, name = "meuse_data", df = meuse)
##D 
##D ## Reads it back into a different object:
##D me2 <- dbReadDataFrame(conn, name = "meuse_data")
##D 
##D ## Check equality:
##D all.equal(meuse, me2)
##D ## Should return TRUE.
## End(Not run)



