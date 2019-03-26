library(lidR)


### Name: lasnormalize
### Title: Remove the topography from a point cloud
### Aliases: lasnormalize lasunnormalize -,LAS,RasterLayer-method
###   -,LAS,function-method

### ** Examples

LASfile <- system.file("extdata", "Topography.laz", package="lidR")
las <- readLAS(LASfile)

plot(las)

# First option: use a RasterLayer as DTM
# =======================================================

dtm <- grid_terrain(las, 1, kriging(k = 10L))
las <- lasnormalize(las, dtm)

plot(dtm)
plot(las)

# restore original elevations
las <- lasunnormalize(las)
plot(las)

# operator - can be used. This is equivalent to the previous
las <- las - dtm
plot(las)

# restore original elevations
las <- lasunnormalize(las)

# Second option: interpolate each point (no discretization)
# =========================================================

las <- lasnormalize(las, tin())
plot(las)

# operator - can be used. This is equivalent to the previous
las <- lasunnormalize(las)
las <- las - tin()

## Not run: 
##D # All the following syntaxes are correct
##D las <- lasnormalize(las, knnidw())
##D las <- lasnormalize(las, knnidw(k = 8, p = 2))
##D las <- las - knnidw()
##D las <- las - knnidw(k = 8)
##D las <- lasnormalize(las, kriging())
##D las <- las - kriging(k = 8)
## End(Not run)




