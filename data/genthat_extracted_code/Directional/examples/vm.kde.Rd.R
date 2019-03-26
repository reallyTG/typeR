library(Directional)


### Name: von Mises kernel density estimation
### Title: Kernel density estimation of circular data with a von Mises
###   kernel
### Aliases: vm.kde
### Keywords: Kernel density von Mises kernel

### ** Examples

x <- rvonmises(100, 2.4, 10, rads = TRUE)
hist(x, freq = FALSE)
f1 <- vm.kde(x, h = 0.1, thumb = "rot", rads = TRUE)$f
f2 <- vm.kde(x, h = 0.1, thumb = "tay", rads = TRUE)$f
h <- vmkde.tune(x)[1]
f3 <- vm.kde(x, h = h, thumb = "none", rads = TRUE)$f
points(x, f1, col = 1)
points(x, f2, col = 2)
points(x, f3, col = 3)



