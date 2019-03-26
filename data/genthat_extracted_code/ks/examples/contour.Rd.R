library(ks)


### Name: contour
### Title: Contours functions
### Aliases: contourLevels contourLevels.kde contourLevels.kda contourSizes
### Keywords: hplot

### ** Examples

set.seed(8192)
x <- rmvnorm.mixt(n=1000, mus=c(0,0), Sigmas=diag(2), props=1)
fhat <- kde(x=x, binned=TRUE)
contourLevels(fhat, cont=c(75, 50, 25))
contourSizes(fhat, cont=25, approx=TRUE) 
   ## compare to approx circle of radius=0.75 with area=1.77



