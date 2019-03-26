library(spatstat)


### Name: plot.bermantest
### Title: Plot Result of Berman Test
### Aliases: plot.bermantest
### Keywords: spatial hplot

### ** Examples

   # synthetic data: nonuniform Poisson process
   X <- rpoispp(function(x,y) { 100 * exp(-x) }, win=square(1))

   # fit uniform Poisson process
   fit0 <- ppm(X, ~1)

   # test covariate = x coordinate
   xcoord <- function(x,y) { x }

   # test wrong model
   k <- berman.test(fit0, xcoord, "Z1")
   
   # plot result of test
   plot(k, col="red", col0="green")

   # Z2 test
   k2 <- berman.test(fit0, xcoord, "Z2")
   plot(k2, col="red", col0="green")



