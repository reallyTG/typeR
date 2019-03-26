library(rts)


### Name: cellFromXY
### Title: Get cell number from row, column or XY
### Aliases: cellFromRowCol cellFromXY
###   cellFromRowCol,RasterStackBrickTS,numeric,numeric-method
###   cellFromXY,RasterStackBrickTS-method
### Keywords: spatial

### ** Examples

## Not run: 
##D file <- system.file("external/ndvi", package="rts")
##D 
##D rt <- rts(file) # read the ndvi time series from the specified file
##D cellFromRowCol(rt,15,20)
##D 
##D cellFromRowCol(rt,c(16:20),c(11:15))
##D 
##D cellFromXY(rt,c(645000,57345000))
## End(Not run)




