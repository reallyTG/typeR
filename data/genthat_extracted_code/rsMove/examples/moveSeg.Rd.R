library(rsMove)


### Name: moveSeg
### Title: moveSeg
### Aliases: moveSeg

### ** Examples

{

 require(raster)

 # read raster data
 r <- raster(system.file('extdata', 'landCover.tif', package="rsMove"))

 # read movement data
 data(shortMove)

 # observation time
 z <- strptime(paste0(shortMove@data$date, ' ', shortMove@data$time),
 format="%Y/%m/%d %H:%M:%S")

 # perform directional sampling
 seg <- moveSeg(r, z, shortMove, data.type="cat")

}



