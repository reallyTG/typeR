library(spatstat)


### Name: Math.linim
### Title: S3 Group Generic Methods for Images on a Linear Network
### Aliases: Math.linim Ops.linim Summary.linim Complex.linim
### Keywords: spatial methods

### ** Examples

  fx <- function(x,y,seg,tp) { (x - y)^2 }
  fL <- linfun(fx, simplenet)
  Z <- as.linim(fL)
  A <- Z+2
  A <- -Z
  A <- sqrt(Z)
  A <- !(Z > 0.1)



