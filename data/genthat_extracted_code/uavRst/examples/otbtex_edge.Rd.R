library(uavRst)


### Name: otbtex_edge
### Title: Calculates edges for a given kernel size.
### Aliases: otbtex_edge

### ** Examples

## Not run: 
##D ##- required packages
##D require(uavRst)
##D require(link2GI)
##D setwd(tempdir())
##D 
##D ## check if OTB exists
##D giLinks <- list()
##D giLinks$otb <- link2GI::linkOTB()
##D 
##D if (giLinks$otb$exist) {
##D data("pacman")
##D pacman<-raster::disaggregate(pacman,10)
##D raster::writeRaster(pacman,"pacman.tif",overwrite=TRUE)
##D 
##D ##- calculate Sobel edge detection
##D r<-otbtex_gray(input="pacman.tif",
##D                filter = "erode",
##D                structype = "ball", 
##D                structype.ball.xradius = 3,
##D                structype.ball.yradius = 3 ,
##D                retRaster = TRUE)
##D 
##D ##- visualize all layers
##D raster::plot(r[[1]])
##D }
## End(Not run)



