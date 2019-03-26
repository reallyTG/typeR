library(constrainedKriging)


### Name: preCKrige
### Title: Spatial Variance-Covariance Matrices for Points and Polygons of
###   any Shape
### Aliases: preCKrige-methods preCKrige preCKrige.points
###   preCKrige.polygons preCKrige.pointsDF preCKrige.polygonsDF
###   preCKrige,SpatialPoints,ANY,covmodel-method
###   preCKrige,SpatialPointsDataFrame,ANY,covmodel-method
###   preCKrige,SpatialPolygons,ANY,covmodel-method
###   preCKrige,SpatialPolygonsDataFrame,ANY,covmodel-method
### Keywords: methods

### ** Examples

## Not run: 
##D ### first example
##D ### load data
##D 
##D data(meuse,meuse.blocks)
##D 
##D ### plot blocks
##D plot(meuse.blocks)
##D 
##D ### compute the approximated block variance of each block in  meuse.blocks
##D ### without the definition of neighbours blocks (default) for an exponential
##D ### covariance function without a measurement error, a nugget  = 0.15 (micro
##D ### scale white noise process) and a scale parameter = 192.5
##D preCK_1  <- preCKrige(newdata = meuse.blocks, model = covmodel(modelname =
##D               "exponential", mev = 0, nugget = 0.05, variance = 0.15,
##D 	      scale = 192.5), pwidth = 75, pheight = 75)
##D 
##D ### plot block approximation of block 59
##D plot(preCK_1, 59)
##D 
##D ### second example
##D ### define neighbours by using the poly2nb function
##D ### of the spdep package
##D if(require(spdep))
##D {
##D neighbours <- poly2nb(meuse.blocks)
##D class(neighbours)
##D ### neighbours should be an object of the class "list"
##D class(neighbours) <- "list"
##D ### compute the approximated block variance-covariance
##D ### matrices of each block in meuse.blocks without the
##D ### defined block neighbours
##D preCK_2 <- preCKrige(newdata = meuse.blocks, neighbours = neighbours,
##D     model = covmodel("exponential", 0.05, 0.15, scale = 192.5),
##D     pwidth = 75, pheight = 75)
##D 
##D ### plot block approximation of block 59 and its
##D ### block neighbours
##D plot(preCK_2, 59)
##D }
##D if(!require(spdep))
##D {
##D cat("Please, install the package spdep to execute this example.\n")
##D }
## End(Not run)



