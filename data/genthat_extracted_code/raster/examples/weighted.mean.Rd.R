library(raster)


### Name: weighted.mean
### Title: Weighted mean of rasters
### Aliases: weighted.mean weighted.mean,RasterStackBrick,vector-method
###   weighted.mean,RasterStackBrick,RasterStackBrick-method

### ** Examples

b <- brick(system.file("external/rlogo.grd", package="raster"))

# give least weight to first layer, most to last layer
wm1 <- weighted.mean(b, w=1:3)

# spatially varying weights
# weigh by column number
w1 <- init(b, v='col')

# weigh by row number
w2 <- init(b, v='row')
w <- stack(w1, w2, w2)

wm2 <- weighted.mean(b, w=w)



