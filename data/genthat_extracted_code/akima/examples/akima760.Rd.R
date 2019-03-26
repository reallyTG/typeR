library(akima)


### Name: akima760
### Title: Sample data from Akima's Bicubic Spline Interpolation code (TOMS
###   760)
### Aliases: akima760
### Keywords: datasets

### ** Examples

## Not run: 
##D library(rgl)
##D data(akima)
##D # data
##D rgl.spheres(akima760$x,akima760$z , akima760$y,0.5,color="red")
##D rgl.bbox()
##D # bivariate linear interpolation
##D # interp:
##D akima.li <- interp(akima$x, akima$y, akima$z, 
##D                    xo=seq(min(akima$x), max(akima$x), length = 100),
##D                    yo=seq(min(akima$y), max(akima$y), length = 100))
##D # interp surface:
##D rgl.surface(akima.li$x,akima.li$y,akima.li$z,color="green",alpha=c(0.5))
##D # interpp:
##D akima.p <- interpp(akima$x, akima$y, akima$z,
##D                     runif(200,min(akima$x),max(akima$x)),
##D                     runif(200,min(akima$y),max(akima$y)))
##D # interpp points:
##D rgl.points(akima.p$x,akima.p$z , akima.p$y,size=4,color="yellow")
##D 
##D # bivariate spline interpolation
##D # data
##D rgl.spheres(akima$x,akima$z , akima$y,0.5,color="red")
##D rgl.bbox()
##D # bivariate cubic spline interpolation
##D # interp:
##D akima.si <- interp(akima$x, akima$y, akima$z, 
##D                    xo=seq(min(akima$x), max(akima$x), length = 100),
##D                    yo=seq(min(akima$y), max(akima$y), length = 100),
##D                    linear = FALSE, extrap = TRUE)
##D # interp surface:
##D rgl.surface(akima.si$x,akima.si$y,akima.si$z,color="green",alpha=c(0.5))
##D # interpp:
##D akima.sp <- interpp(akima$x, akima$y, akima$z,
##D                     runif(200,min(akima$x),max(akima$x)),
##D                     runif(200,min(akima$y),max(akima$y)),
##D                    linear = FALSE, extrap = TRUE)
##D # interpp points:
##D rgl.points(akima.sp$x,akima.sp$z , akima.sp$y,size=4,color="yellow")
##D 
## End(Not run)



