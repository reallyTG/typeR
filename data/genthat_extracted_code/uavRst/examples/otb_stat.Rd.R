library(uavRst)


### Name: otb_stat
### Title: Calculates local statistics for a given kernel size
### Aliases: otb_stat

### ** Examples

## Not run: 
##D require(uavRst)
##D require(link2GI)
##D # check if OTB is installed correctly
##D giLinks<-list()
##D giLinks$otb <- link2GI::linkOTB()
##D if (giLinks$otb$exist) {
##D setwd(tempdir())
##D data("pacman")
##D raster::writeRaster(pacman,"pacman.tif",overwrite=TRUE)
##D 
##D # calculate statistics
##D result<- otb_stat(input="pacman.tif",
##D                   radius=5,
##D                   retRaster = TRUE,
##D                   channel = 1, 
##D                   giLinks = giLinks)
##D #plot the results :
##D raster::plot(result[[1]])
##D }
## End(Not run)



