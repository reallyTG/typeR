library(uavRst)


### Name: rgb_indices
### Title: RGB indices
### Aliases: rgb_indices

### ** Examples

## ## ##
##- setup environment
require(uavRst)
data(rgb)

##- visualize the image
raster::plotRGB(rgb)

##- calculate the indices
rgbI<-rgb_indices(red   = rgb[[1]],
                 green = rgb[[2]],
                 blue  = rgb[[3]],
                 rgbi = c("NDTI","VARI","TGI"))

##- visualize the indices
raster::plot(rgbI)
##+



