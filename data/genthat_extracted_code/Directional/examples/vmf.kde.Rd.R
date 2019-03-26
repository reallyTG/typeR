library(Directional)


### Name: von Mises-Fisher kernel density estimation for (hyper-)spherical data
### Title: Kernel density estimation for (hyper-)spherical data using a von
###   Mises-Fisher kernel
### Aliases: vmf.kde
### Keywords: von Mises-Fisher Kernel density estimate

### ** Examples

x <- rvmf(100, rnorm(5), 15)
h <- vmfkde.tune(x)[1]
f1 <- vmf.kde(x, h = h, thumb = "none")
f2 <- vmf.kde(x, h = h, thumb = "rot")
f1$h  ;  f2$h



