library(raster)


### Name: barplot
### Title: Bar plot of a RasterLayer
### Aliases: barplot barplot,RasterLayer-method
### Keywords: methods spatial

### ** Examples
 
f <- system.file("external/test.grd", package="raster")
r <- raster(f)
barplot(r, digits=-2, las=2, ylab='Frequency')

op <- par(no.readonly = TRUE)
par(mai = c(1, 2, .5, .5))
barplot(r, breaks=10, col=c('red', 'blue'), horiz=TRUE, digits=NULL, las=1)
par(op)



