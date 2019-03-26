library(spatstat)


### Name: rgbim
### Title: Create Colour-Valued Pixel Image
### Aliases: rgbim hsvim
### Keywords: spatial manip datagen

### ** Examples

  ## Don't show: 
    op <- spatstat.options(npixel=32)
  
## End(Don't show)
  # create three images with values in [0,1]
  X <- setcov(owin())
  X <- eval.im(pmin(1,X))
  M <- Window(X)
  Y <- as.im(function(x,y){(x+1)/2}, W=M)
  Z <- as.im(function(x,y){(y+1)/2}, W=M)
  # convert 
  RGB <- rgbim(X, Y, Z, maxColorValue=1)
  HSV <- hsvim(X, Y, Z)
  opa <- par(mfrow=c(1,2))
  plot(RGB, valuesAreColours=TRUE)
  plot(HSV, valuesAreColours=TRUE)
  par(opa)
  ## Don't show: 
    spatstat.options(op)
  
## End(Don't show)



