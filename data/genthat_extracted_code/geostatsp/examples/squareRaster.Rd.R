library(geostatsp)


### Name: squareRaster-methods
### Title: Create a raster with square cells
### Aliases: squareRaster squareRaster-methods squareRaster,matrix-method
###   squareRaster,Raster-method squareRaster,Spatial-method
###   squareRaster,Extent-method

### ** Examples


myraster = raster(matrix(0,10,10),xmn=0,xmx=10,ymn=0,ymx=12.3)

squareRaster(myraster)

squareRaster(extent(myraster), cells=10)

squareRaster(bbox(myraster), cells=10)




