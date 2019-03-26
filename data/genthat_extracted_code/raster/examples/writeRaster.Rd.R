library(raster)


### Name: writeRaster
### Title: Write raster data to a file
### Aliases: writeRaster,RasterLayer,character-method
###   writeRaster,RasterStackBrick,character-method writeRaster
### Keywords: spatial methods

### ** Examples
 
r <- raster(system.file("external/test.grd", package="raster"))

# take a small part
r <- crop(r, extent(179880, 180800, 329880, 330840) )

# write to an integer binary file
rf <- writeRaster(r, filename="allint.grd", datatype='INT4S', overwrite=TRUE)

# make a brick and save multi-layer file
b <- brick(r, sqrt(r))
bf <- writeRaster(b, filename="multi.grd", bandorder='BIL', overwrite=TRUE)

# write to a new geotiff file (depends on rgdal)
if (require(rgdal)) {
  rf <- writeRaster(r, filename="test.tif", format="GTiff", overwrite=TRUE)
  bf <- writeRaster(b, filename="multi.tif", options="INTERLEAVE=BAND", overwrite=TRUE)
}
 
# write to netcdf 
if (require(ncdf4)) {	
 rnc <- writeRaster(r, filename='netCDF.nc', format="CDF", overwrite=TRUE)   
}



