library(spatial.tools)


### Name: getValuesBlock_enhanced
### Title: Easier-to-use function for grabbing a block of data out of a
###   Raster*.
### Aliases: getValuesBlock_enhanced

### ** Examples

library("raster")
tahoe_highrez <- brick(system.file("external/tahoe_highrez.tif", package="spatial.tools"))
mychunk <- getValuesBlock_enhanced(tahoe_highrez,r1=100,r2=110,c1=20,c2=50)
class(mychunk)
dim(mychunk)
mychunk_raster <- getValuesBlock_enhanced(tahoe_highrez,r1=100,r2=110,c1=20,c2=50,format="raster")
mychunk_raster



