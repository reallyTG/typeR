library(raster)


### Name: pairs
### Title: Pairs plot (matrix of scatterplots)
### Aliases: pairs pairs,RasterStackBrick-method
### Keywords: spatial

### ** Examples

r <- raster(system.file("external/test.grd", package="raster") )
s <- stack(r, 1/r, sqrt(r))
pairs(s)

## Not run: 
##D # to make indvidual histograms:
##D hist(r)
##D # or scatter plots:
##D plot(r, 1/r)
## End(Not run)



