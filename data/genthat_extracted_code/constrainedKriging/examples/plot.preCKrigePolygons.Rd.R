library(constrainedKriging)


### Name: plot.preCKrigePolygons
### Title: Plotting polygon configurations and their approximated areas
### Aliases: plot.preCKrigePolygons
### Keywords: dplot

### ** Examples

## Not run: 
##D ### load data
##D data(meuse,meuse.blocks)
##D 
##D ### plot blocks
##D plot(meuse.blocks)
##D 
##D ### compute the approximated block variance of each block in
##D ### meuse.blocks without the definition of neighbours blocks (default)
##D preCK_1  <- preCKrige(newdata = meuse.blocks,
##D     model = covmodel("exponential", 0.05, 0.15, scale = 192.5),
##D     pwidth = 75, pheight = 75)
##D 
##D ### plot block approximation of block 59
##D plot(preCK_1, 59)
##D 
##D 
##D ### define neighbours
##D if(require(spdep))
##D {
##D neighbours <- poly2nb(meuse.blocks)
##D class(neighbours)
##D ### neighbours should be an object of the class "list"
##D class(neighbours) <- "list"
##D ### compute the approximated block variance-covariance matrices of each block in
##D ### meuse.blocks without the defined block neighbours
##D preCK_2 <- preCKrige(newdata = meuse.blocks, neighbours = neighbours,
##D     model = covmodel("exponential", 0.05, 0.15, scale = 192.5),
##D     pwidth = 75, pheight = 75)
##D 
##D ### plot block approximation of block 59 and its
##D ### block neighbours
##D plot(preCK_1, 59)
##D }
##D if(!require(spdep))
##D {
##D cat("Please, install the package spdep to excute this example.\n")
##D }
##D 
## End(Not run)



