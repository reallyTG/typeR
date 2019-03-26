library(spatstat)


### Name: ppmInfluence
### Title: Leverage and Influence Measures for Spatial Point Process Model
### Aliases: ppmInfluence
### Keywords: spatial models

### ** Examples

   X <- rpoispp(function(x,y) { exp(3+3*x) })
   fit <- ppm(X ~ x+y)
   fI <- ppmInfluence(fit)

   fitlev <- fI$leverage
   fitlev <- leverage(fI)

   fitinf <- fI$influence
   fitinf <- influence(fI)

   fitdfb <- fI$dfbetas
   fitdfb <- dfbetas(fI) 



