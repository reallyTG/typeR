library(spatstat)


### Name: Extract.linim
### Title: Extract Subset of Pixel Image on Linear Network
### Aliases: [.linim
### Keywords: spatial manip

### ** Examples

  M <- as.mask.psp(as.psp(simplenet))
  Z <- as.im(function(x,y){x}, W=M)
  Y <- linim(simplenet, Z)
  X <- runiflpp(4, simplenet)
  Y[X]
  Y[square(c(0.3, 0.6))]



