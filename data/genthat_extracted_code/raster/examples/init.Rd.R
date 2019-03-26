library(raster)


### Name: initialize
### Title: Intitialize a Raster object with values
### Aliases: init
### Keywords: spatial

### ** Examples

r <- raster(ncols=36, nrows=18)

x <- init(r, fun='cell')

y <- init(r, fun=runif)

# there are different ways to set all values to 1 
# for large rasters:
set1f <- function(x){rep(1, x)}
z1 <- init(r, fun=set1f, filename='test.grd', overwrite=TRUE)

# This is equivalent to (but not memory safe):
z2 <- setValues(r, rep(1, ncell(r)))
# or  
r[] <- rep(1, ncell(r))
# or  
r[] <- 1



