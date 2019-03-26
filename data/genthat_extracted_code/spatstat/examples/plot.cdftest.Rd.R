library(spatstat)


### Name: plot.cdftest
### Title: Plot a Spatial Distribution Test
### Aliases: plot.cdftest
### Keywords: spatial hplot

### ** Examples

   op <- options(useFancyQuotes=FALSE)

   # synthetic data: nonuniform Poisson process
   X <- rpoispp(function(x,y) { 100 * exp(x) }, win=square(1))

   # fit uniform Poisson process
   fit0 <- ppm(X, ~1)

   # test covariate = x coordinate
   xcoord <- function(x,y) { x }

   # test wrong model
   k <- cdf.test(fit0, xcoord)

   # plot result of test
   plot(k, lwd0=3)

   plot(k, style="PP")

   plot(k, style="QQ")

   options(op)



