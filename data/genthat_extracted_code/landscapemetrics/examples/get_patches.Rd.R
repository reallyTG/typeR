library(landscapemetrics)


### Name: get_patches
### Title: get_patches
### Aliases: get_patches get_patches.RasterLayer get_patches.RasterStack
###   get_patches.RasterBrick get_patches.list get_patches.matrix

### ** Examples

# check for patches of class 1
patched_raster  <-  get_patches(landscape, 1)

# count patches
length(raster::unique(patched_raster[[1]]))

# check for patches of every class
patched_raster <-  get_patches(landscape)




