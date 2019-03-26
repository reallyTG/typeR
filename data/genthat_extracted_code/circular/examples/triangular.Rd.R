library(circular)


### Name: triangular
### Title: Triangular Density Function
### Aliases: dtriangular rtriangular
### Keywords: distribution

### ** Examples


data1 <- rtriangular(100, 0.3, control.circular=list(units="degrees"))
plot(data1)

ff <- function(x) dtriangular(x, rho=0.3)
curve.circular(ff, shrink=1.2, join=TRUE)




