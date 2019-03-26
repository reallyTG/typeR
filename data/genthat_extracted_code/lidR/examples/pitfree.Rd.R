library(lidR)


### Name: pitfree
### Title: Digital Surface Model Algorithm
### Aliases: pitfree

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las <- readLAS(LASfile)
col <- height.colors(50)

# Basic triangulation and rasterization of first returns
chm <- grid_canopy(las, res = 0.5, dsmtin())
plot(chm, col = col)

# Khosravipour et al. pitfree algorithm
chm <- grid_canopy(las, res = 0.5, pitfree(c(0,2,5,10,15), c(0, 1.5)))
plot(chm, col = col)

## Not run: 
##D # Potentially complex concave subset of point cloud
##D x = c(481340, 481340, 481280, 481300, 481280, 481340)
##D y = c(3812940, 3813000, 3813000, 3812960, 3812940, 3812940)
##D las2 = lasclipPolygon(las,x,y)
##D plot(las2)
##D 
##D # Since the TIN interpolation is done within the convex hull of the point cloud
##D # dummy pixels are interpolated that are strictly correct according to the interpolation method
##D # used, but meaningless in our CHM
##D chm <- grid_canopy(las2, res = 0.5, pitfree())
##D plot(chm, col = col)
##D 
##D chm = grid_canopy(las2, res = 0.5, pitfree(max_edge = c(3, 1.5)))
##D plot(chm, col = col)
## End(Not run)



