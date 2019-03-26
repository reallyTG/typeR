library(spatstat)


### Name: linim
### Title: Create Pixel Image on Linear Network
### Aliases: linim
### Keywords: spatial

### ** Examples

  Z <- as.im(function(x,y) {x-y}, Frame(simplenet))
  X <- linim(simplenet, Z)
  X



