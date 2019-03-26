library(spatstat)


### Name: dfbetas.ppm
### Title: Parameter Influence Measure
### Aliases: dfbetas.ppm
### Keywords: spatial models

### ** Examples

   ## Don't show: 
op <- spatstat.options(npixel=32)
## End(Don't show)
   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X ~x+y)
   ## Don't show: 
fit <- ppm(X ~x+y, nd=16)
## End(Don't show)
   plot(dfbetas(fit))
   plot(Smooth(dfbetas(fit)))
   ## Don't show: 
spatstat.options(op)
## End(Don't show)



