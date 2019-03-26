library(ibs)


### Name: bspline
### Title: B-spline function
### Aliases: bspline
### Keywords: math

### ** Examples

kns <- c(rep(0,4),1:4*0.2,rep(1,4))
bspline(0:10/10,kns,3,rep(1,length(kns)-3))
splines::splineDesign(kns,0:10/10,3)%*%rep(1,length(kns)-3)



