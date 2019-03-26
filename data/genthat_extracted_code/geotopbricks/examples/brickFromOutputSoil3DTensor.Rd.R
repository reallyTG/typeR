library(geotopbricks)


### Name: brickFromOutputSoil3DTensor
### Title: brickFromOutputSoil3DTensor
### Aliases: brickFromOutputSoil3DTensor rasterFromOutput2DMap

### ** Examples


library(geotopbricks)
# The data containing in the link are only for educational use
wpath <- "http://www.rendena100.eu/public/geotopbricks/simulations/idroclim_test1"
x <- "SoilLiqContentTensorFile"
tz <-  "Etc/GMT+1"
when <- as.POSIXct("2002-03-22",tz=tz)

# Not Run because it elapses too long time!!! 
# Please Uncomment the following lines to run by yourself!!!
# b <- brickFromOutputSoil3DTensor(x,when=when,wpath=wpath,tz=tz,use.read.raster.from.url=TRUE)

# a 2D map: 
x_e <- "SnowDepthMapFile"
# Not Run: uncomment the following line
# m <- rasterFromOutput2DMap(x_e,when=when,wpath=wpath,timestep="OutputSnowMaps",
#                            tz=tz,use.read.raster.from.url=TRUE)
## NOTE: set use.read.raster.from.url=FALSE (default) 
# if the "wpath" directorty is in the local file system.
# Not Run: uncomment the following line
# plot(m)




