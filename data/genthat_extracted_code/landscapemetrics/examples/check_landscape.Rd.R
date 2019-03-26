library(landscapemetrics)


### Name: check_landscape
### Title: Check input landscape
### Aliases: check_landscape check_landscape.RasterLayer
###   check_landscape.RasterStack check_landscape.RasterBrick
###   check_landscape.stars check_landscape.list

### ** Examples

check_landscape(augusta_nlcd)
check_landscape(podlasie_ccilc)
check_landscape(landscape)
landscape_stack = raster::stack(landscape, landscape)
check_landscape(landscape_stack)




