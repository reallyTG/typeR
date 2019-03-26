library(lidR)


### Name: p2r
### Title: Digital Surface Model Algorithm
### Aliases: p2r

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las <- readLAS(LASfile)
col <- height.colors(50)

# Points-to-raster algorithm with a resolution of 1 meter
chm <- grid_canopy(las, res = 1, p2r())
plot(chm, col = col)

# Points-to-raster algorithm with a resolution of 0.5 meters replacing each
# point by a 20 cm radius circle of 8 points
chm <- grid_canopy(las, res = 0.5, p2r(0.2))
plot(chm, col = col)

## Not run: 
##D chm <- grid_canopy(las, res = 0.5, p2r(0.2, na.fill = tin()))
##D plot(chm, col = col)
## End(Not run)



