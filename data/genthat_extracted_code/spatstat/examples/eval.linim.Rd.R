library(spatstat)


### Name: eval.linim
### Title: Evaluate Expression Involving Pixel Images on Linear Network
### Aliases: eval.linim
### Keywords: spatial manip programming

### ** Examples

  M <- as.mask.psp(as.psp(simplenet))
  Z <- as.im(function(x,y) {x-y}, W=M)
  X <- linim(simplenet, Z)
  X

  Y <- linfun(function(x,y,seg,tp){y^2+x}, simplenet)
  Y <- as.linim(Y)
  
  eval.linim(X + 3)
  eval.linim(X - Y)
  eval.linim(abs(X - Y))
  Z <- eval.linim(sin(X * pi) + Y)



