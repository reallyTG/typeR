library(raster)


### Name: localFun
### Title: Local functions
### Aliases: localFun localFun,RasterLayer,RasterLayer-method
### Keywords: methods spatial

### ** Examples

set.seed(0)
b <- stack(system.file("external/rlogo.grd", package="raster"))
x <- flip(b[[2]], 'y') + runif(ncell(b))
y <- b[[1]] + runif(ncell(b))

f <- localFun(x, y, fun=cor)

## Not run: 
##D # local regression:
##D rfun <- function(x, y, ...) {
##D 	m <- lm(y~x)
##D 	# return R^2
##D 	summary(m)$r.squared
##D }
##D 
##D ff <- localFun(x, y, fun=rfun)
##D plot(f, ff)
## End(Not run)



