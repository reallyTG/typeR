library(oceanmap)


### Name: nc2raster
### Title: Convert Raster layer to a matrix or array
### Aliases: nc2raster

### ** Examples

path <- system.file("test_files", package="oceanmap")
nfiles <- Sys.glob(paste0(path,'/*.nc'))[1] # load sample-'.nc'-files

nc2raster(nfiles[1],"Conc",layer=1) # RasterLayer
nc2raster(nfiles[1],"Conc",layer=1:4) # RasterStack

library('ncdf4')
nc <- nc_open(nfiles[1])
nc2raster(nc,"Conc",layer=1:4) # RasterStack

###### load & plot sample netcdf-file ('.nc'-file)

### option a) load netcdf-file with ncdf4-package and plot it
library('ncdf4')
ncdf <- nc_open(nfiles[1])
print(ncdf)
v(obj = ncdf, cbpos="r")

### option b) load and plot netcdf-file as RasterStack object
nc <- nc2raster(nfiles[1])
v(nc,cbpos="r") # plot RasterStack object
v(nfiles[1], cbpos="r",replace.na=TRUE) # plot directly netcdf-file

### option c) plot netcdf-file directly
v(nfiles[1], cbpos="r") # plot RasterStack object

###### plot multiple layers:
par(mfrow=c(2,2))
v(nfiles[1], t=1:4, cbpos="r", replace.na=TRUE, subplot = TRUE)




