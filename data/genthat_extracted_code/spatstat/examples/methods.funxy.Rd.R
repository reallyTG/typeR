library(spatstat)


### Name: methods.funxy
### Title: Methods for Spatial Functions
### Aliases: methods.funxy contour.funxy persp.funxy plot.funxy
### Keywords: spatial methods

### ** Examples

   f <- distfun(letterR)
   contour(f)
   B <- owin(c(1,5), c(-1, 4))
   contour(f, W=B)
   persp(f, W=B, theta=40, phi=40, border=NA, shade=0.7)



