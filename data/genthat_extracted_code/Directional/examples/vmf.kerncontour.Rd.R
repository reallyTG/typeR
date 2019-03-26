library(Directional)


### Name: Contour plot of spherical data using a von Mises-Fisher kernel density estimate
### Title: Contour plot of spherical data using a von Mises-Fisher kernel
###   density estimate
### Aliases: vmf.kerncontour
### Keywords: Contour plot von Mises-Fisher kernel

### ** Examples

x <- rvmf(100, rnorm(3), 15)
x <- euclid.inv(x)
par( mfrow = c(1, 2) )
vmf.kerncontour(x, "rot")
vmf.kerncontour(x, "none")



