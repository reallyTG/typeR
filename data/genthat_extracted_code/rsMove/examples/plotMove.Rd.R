library(rsMove)


### Name: plotMove
### Title: plotMove
### Aliases: plotMove

### ** Examples

{

 require(raster)

 # read raster data
 r <- raster(system.file('extdata', '2013-07-16_ndvi.tif', package="rsMove"))

 # read movement data
 data(shortMove)

 # observation time
 time <- strptime(paste0(shortMove@data$date, ' ', shortMove@data$time), format="%Y/%m/%d %H:%M:%S")

 # reduce amount of samples
 move.reduce <- moveReduce(shortMove, r, time)

 # query data
 ov <- extract(r, move.reduce$points)

 # plot output
 x <- move.reduce$points@data$x
 y <- move.reduce$points@data$y
 et <- move.reduce$points@data$elapsed.time
 op <- plotMove(x, y, size.var=et, fill.var=ov, var.type="cont")

}



