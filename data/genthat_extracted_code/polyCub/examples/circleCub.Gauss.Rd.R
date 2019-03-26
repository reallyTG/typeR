library(polyCub)


### Name: circleCub.Gauss
### Title: Integration of the Isotropic Gaussian Density over Circular
###   Domains
### Aliases: circleCub.Gauss
### Keywords: math spatial

### ** Examples

circleCub.Gauss(center=c(1,2), r=3, mean=c(4,5), sd=6)

if (requireNamespace("mvtnorm") && gpclibPermit() && requireNamespace("spatstat")) {
  ## compare with cubature over a polygonal approximation of a circle
  disc.poly <- spatstat::disc(radius=3, centre=c(1,2), npoly=32)
  polyCub.exact.Gauss(disc.poly, mean=c(4,5), Sigma=6^2*diag(2))
}



