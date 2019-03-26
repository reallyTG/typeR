library(raster)


### Name: xyFromCell
### Title: Coordinates from a row, column or cell number
### Aliases: xFromCol xFromCol,Raster,numeric-method
###   xFromCol,Raster,missing-method yFromRow
###   yFromRow,Raster,numeric-method yFromRow,Raster,missing-method
###   xFromCell xFromCell,Raster,numeric-method yFromCell
###   yFromCell,Raster,numeric-method xyFromCell
###   xyFromCell,BasicRaster-method xyFromCell,BasicRaster,ANY-method
###   xyFromCell,Raster-method
### Keywords: spatial

### ** Examples

#using a new default raster (1 degree global)
r <- raster()
xFromCol(r, c(1, 120, 180))
yFromRow(r, 90)
xyFromCell(r, 10000)
xyFromCell(r, c(0, 1, 32581, ncell(r), ncell(r)+1))

#using a file from disk
r <- raster(system.file("external/test.grd", package="raster"))
r
cellFromXY(r, c(180000, 330000))
#xy for corners of a raster:
xyFromCell(r, c(1, ncol(r), ncell(r)-ncol(r)+1, ncell(r)))



