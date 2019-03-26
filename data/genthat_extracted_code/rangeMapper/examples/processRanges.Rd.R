library(rangeMapper)


### Name: processRanges
### Title: processRanges
### Aliases: processRanges
###   processRanges,SQLiteConnection,SpatialPolygonsDataFrame,missing,character,missing-method
###   processRanges,SQLiteConnection,SpatialPolygonsDataFrame,missing,character,list-method
###   processRanges,SQLiteConnection,missing,character,missing,missing-method
###   processRanges,SQLiteConnection,missing,character,missing,list-method

### ** Examples

require(rangeMapper)
require(rgdal)
## Not run: 
##D if (require(doParallel) ) {
##D  cl = makePSOCKcluster(2)
##D  registerDoParallel(cl)
##D  }
## End(Not run)

dbcon = rangeMap.start(file = "wrens.sqlite", dir = tempdir(), overwrite = TRUE)
f = system.file(package = "rangeMapper", "extdata", "wrens", "vector_combined")
r = readOGR(f, "wrens", verbose = FALSE)[1:50, ]
global.bbox.save(con = dbcon, bbox = r)
gridSize.save(dbcon, gridSize = 5)
canvas.save(dbcon)
processRanges(con = dbcon, spdf = r, ID = "sci_name", metadata = rangeTraits() )
dbDisconnect(dbcon)

## Not run: 
##D stopCluster(cl)
## End(Not run)



