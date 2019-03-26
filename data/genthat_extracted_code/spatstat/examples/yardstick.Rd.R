library(spatstat)


### Name: yardstick
### Title: Text, Arrow or Scale Bar in a Diagram
### Aliases: textstring onearrow yardstick
### Keywords: spatial hplot

### ** Examples

  X <- rescale(swedishpines)
  plot(X, pch=16, main="")
  yd <- yardstick(0,0,1,1, "diagonal")
  yy <- yardstick(X[1:2])
  ys <- yardstick(as.psp(list(xmid=4, ymid=0.5, length=1, angle=0),
                         window=Window(X)),
                  txt="1 m")
  ys
  plot(ys, angle=90)
  scalardilate(ys, 2)



