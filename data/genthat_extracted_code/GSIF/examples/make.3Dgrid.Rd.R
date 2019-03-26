library(GSIF)


### Name: make.3Dgrid
### Title: Methods to prepare 3D prediction locations
### Aliases: make.3Dgrid sp3D sp3D,SpatialPixelsDataFrame-method
###   sp3D,list-method make.3Dgrid,SpatialPixelsDataFrame-method
###   make.3Dgrid,RasterBrick-method
### Keywords: methods

### ** Examples

## grids Ebergotzen:
library(plotKML)
library(rgdal)
library(raster)

data(eberg_grid)
gridded(eberg_grid) <- ~x+y
proj4string(eberg_grid) <- CRS("+init=epsg:31467")
##  convert to spatial components:
formulaString <- ~ PRMGEO6+DEMSRT6+TWISRT6+TIRAST6
eberg_spc <- spc(eberg_grid, formulaString)
## create 3D locations in the original coordinate system:
eberg_3Dxy <- sp3D(eberg_spc@predicted)
## Not run: 
##D ## wrapper function to create 3D locations in the default WGS84 system:
##D eberg_3D <- make.3Dgrid(eberg_spc@predicted)
##D image(eberg_3D[[1]]["PC1"])
##D ## downscale 100 m resolution imagery to 25 m:
##D data(eberg_grid25)
##D gridded(eberg_grid25) <- ~x+y
##D proj4string(eberg_grid25) <- CRS("+init=epsg:31467")
##D eberg_grid25@data <- cbind(eberg_grid25@data, 
##D     warp(eberg_grid, pixsize=eberg_grid25@grid@cellsize[1], 
##D     GridTopology=eberg_grid25@grid, resampling_method="cubicspline")@data)
##D ## this function requires FWTools!
## End(Not run)



