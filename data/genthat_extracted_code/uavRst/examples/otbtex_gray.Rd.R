library(uavRst)


### Name: otbtex_gray
### Title: Calculates Gray scale morphological operations for a given
###   kernel size.
### Aliases: otbtex_gray

### ** Examples

## Not run: 
##D require(uavRst)
##D require(link2GI)
##D setwd(tempdir())
##D ## check if OTB exists
##D giLinks<-list()
##D giLinks$otb <- link2GI::linkOTB()
##D 
##D if (giLinks$otb$exist) {
##D data("pacman")
##D raster::writeRaster(pacman,"pacman.tif",overwrite=TRUE)
##D r<-otbtex_gray(input="pacman.tif",retRaster = TRUE)
##D 
##D ##- visualize all layers
##D raster::plot(r[[1]])
##D }
## End(Not run)



