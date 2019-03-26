library(fpc)


### Name: mahalanofix
### Title: Mahalanobis distances from center of indexed points
### Aliases: mahalanofix mahalanofuz
### Keywords: multivariate

### ** Examples

  x <- c(1,2,3,4,5,6,7,8,9,10)
  y <- c(1,2,3,8,7,6,5,8,9,10)
  mahalanofix(cbind(x,y),gv=c(0,0,0,1,1,1,1,1,0,0))
  mahalanofix(cbind(x,y),gv=c(0,0,0,1,1,1,1,0,0,0))
  mahalanofix(cbind(x,y),gv=c(0,0,0,1,1,1,1,1,0,0),method="mcd")
  mahalanofuz(cbind(x,y),gv=c(0,0,0.5,0.5,1,1,1,0.5,0.5,0))



