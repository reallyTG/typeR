library(ibs)


### Name: bsbases
### Title: B-spline bases
### Aliases: bsbases
### Keywords: math

### ** Examples

kns <- c(rep(0,4),1:4*0.2,rep(1,4))
round(bsbases(0:5/5,kns,2),10)
round(splines::splineDesign(kns,0:5/5,2),10)



