library(raster)


### Name: boundaries
### Title: boundaries (edges) detection
### Aliases: boundaries boundaries,RasterLayer-method
### Keywords: methods spatial

### ** Examples

r <- raster(nrow=18, ncol=36, xmn=0)
r[150:250] <- 1
r[251:450] <- 2
plot( boundaries(r, type='inner') )
plot( boundaries(r, type='outer') )
plot( boundaries(r, classes=TRUE) )



