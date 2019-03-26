library(spatstat)


### Name: methods.objsurf
### Title: Methods for Objective Function Surfaces
### Aliases: methods.objsurf print.objsurf plot.objsurf persp.objsurf
###   image.objsurf contour.objsurf
### Keywords: spatial hplot

### ** Examples

 fit <- kppm(redwood ~ 1, "Thomas")
 os <- objsurf(fit)
  os
  plot(os)
  contour(os, add=TRUE)
  persp(os)



