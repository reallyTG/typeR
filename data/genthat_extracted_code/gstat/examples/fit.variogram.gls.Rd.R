library(gstat)


### Name: fit.variogram.gls
### Title: GLS fitting of variogram parameters
### Aliases: fit.variogram.gls
### Keywords: models

### ** Examples

library(sp)
data(meuse)
coordinates(meuse) = ~x+y
## Not run: 
##D fit.variogram.gls(log(zinc)~1, meuse[1:40,], vgm(1, "Sph", 900,1))
## End(Not run)



