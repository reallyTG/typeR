library(spatstat)


### Name: Extract.leverage.ppm
### Title: Extract Subset of Leverage Object
### Aliases: [.leverage.ppm
### Keywords: spatial manip

### ** Examples

   fit <- ppm(cells ~x)
   lev <- leverage(fit)
   b <- owin(c(0.1, 0.3), c(0.2, 0.4))
   lev[b]
   lev[cells]



