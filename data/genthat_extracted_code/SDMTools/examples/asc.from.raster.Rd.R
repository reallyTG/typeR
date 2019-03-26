library(SDMTools)


### Name: asc.from.raster
### Title: Raster conversion functions for adehabitat, raster and sp
###   packages
### Aliases: as.asc asc.from.raster asc.from.sp raster.from.asc sp.from.asc

### ** Examples

#create a simple object of class 'asc'
tasc = as.asc(matrix(rep(x=1:10, times=1000),nr=100)); print(tasc)
str(tasc)

#convert to RasterLayer
traster = raster.from.asc(tasc)
str(traster)

#convert to SpatialGridDataFrame
tgrid = sp.from.asc(tasc)
str(tgrid)

#create a basic object of class asc
tasc = as.asc(matrix(rep(x=1:10, times=1000),nr=100)); print(tasc)



