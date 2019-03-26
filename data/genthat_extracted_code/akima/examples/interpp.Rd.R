library(akima)


### Name: interpp
### Title: Pointwise Bivariate Interpolation for Irregular Data
### Aliases: interpp
### Keywords: dplot

### ** Examples

data(akima)
# linear interpolation at points (1,2), (5,6) and (10,12)
akima.lip<-interpp(akima$x, akima$y, akima$z,c(1,5,10),c(2,6,12))
akima.lip$z
# spline interpolation
akima.sip<-interpp(akima$x, akima$y, akima$z,c(1,5,10),c(2,6,12),
  linear=FALSE)
akima.sip$z
## Not run: 
##D     ## interaction with sp objects:
##D     library(sp)
##D     ## take 30 sample points out of meuse grid:
##D     data(meuse.grid)
##D     m0 <- meuse.grid[sample(1:3103,30),]
##D     coordinates(m0) <- ~x+y
##D     ## interpolate on this 30 points:
##D     ## note: both "meuse" and "m0" are sp objects
##D     ## (SpatialPointsDataFrame) !!
##D     ## arguments z and xo have to named, y has to be omitted!
##D     ipp <- interpp(meuse,z="zinc",xo=m0)
##D     spplot(ipp)
## End(Not run)



