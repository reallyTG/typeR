library(spatstat)


### Name: objsurf
### Title: Objective Function Surface
### Aliases: objsurf objsurf.dppm objsurf.kppm objsurf.minconfit
### Keywords: spatial models

### ** Examples

   fit <- kppm(redwood ~ 1, "Thomas")
   os <- objsurf(fit)

   if(interactive()) {
     plot(os)
     contour(os, add=TRUE)
     persp(os)
   }



