library(rsMove)


### Name: moveReduce
### Title: moveReduce
### Aliases: moveReduce

### ** Examples

{

 require(raster)

 # read raster data
 r <- raster(system.file('extdata', '2013-07-16_ndvi.tif', package="rsMove"))

 # read movement data
 data(shortMove)

 # observation time
 z <- strptime(paste0(shortMove@data$date, ' ', shortMove@data$time),
 format="%Y/%m/%d %H:%M:%S")

 # reduce amount of samples
 move.reduce <- moveReduce(shortMove, r, z, derive.raster=TRUE)

}



