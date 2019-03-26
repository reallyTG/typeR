library(spatstat)


### Name: ellipse
### Title: Elliptical Window.
### Aliases: ellipse
### Keywords: spatial datagen

### ** Examples

  W <- ellipse(a=5,b=2,centre=c(5,1),phi=pi/6)
  plot(W,lwd=2,border="red")
  WM <- ellipse(a=5,b=2,centre=c(5,1),phi=pi/6,mask=TRUE,dimyx=512)
  plot(WM,add=TRUE,box=FALSE)



