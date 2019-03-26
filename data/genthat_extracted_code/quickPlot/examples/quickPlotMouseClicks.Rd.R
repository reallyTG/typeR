library(quickPlot)


### Name: clickValues
### Title: Mouse interactions with Plots
### Aliases: clickValues clickExtent clickCoordinates .clickCoord
### Keywords: internal

### ** Examples

## Not run: 
##D   library(igraph)
##D   library(raster)
##D 
##D   files <- system.file("maps", package = "quickPlot") %>%
##D     dir(., full.names = TRUE, pattern = "tif")
##D   maps <- lapply(files, function(x) raster(x))
##D   names(maps) <- sapply(basename(files), function(x) {
##D     strsplit(x, split = "\\.")[[1]][1]
##D   })
##D   landscape <- stack(maps$DEM, maps$forestCover, maps$habitatQuality)
##D 
##D   clearPlot()
##D   Plot(landscape)
##D   clickValues(3) # click at three locations on the Plot device
##D 
##D   clearPlot()
##D   Plot(landscape)
##D   e <- clickExtent() # click at two locations on the Plot device
##D   print(e)
##D 
##D   # repeated zooming to try various places on the original device
##D   for(i in 1:4) clickExtent() # click at two locations on the Plot device
## End(Not run)




