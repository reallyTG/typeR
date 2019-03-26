library(spatstat)


### Name: rotate.infline
### Title: Rotate or Shift Infinite Lines
### Aliases: rotate.infline shift.infline reflect.infline flipxy.infline
### Keywords: spatial manip

### ** Examples

  L <- infline(v=0.5)

  plot(square(c(-1,1)), main="rotate lines", type="n")
  points(0, 0, pch=3)
  plot(L, col="green")
  plot(rotate(L, pi/12), col="red")
  plot(rotate(L, pi/6), col="red")
  plot(rotate(L, pi/4), col="red")

  L <- infline(p=c(0.4, 0.9), theta=pi* c(0.2, 0.6))

  plot(square(c(-1,1)), main="shift lines", type="n")
  L <- infline(p=c(0.7, 0.8), theta=pi* c(0.2, 0.6))
  plot(L, col="green")
  plot(shift(L, c(-0.5, -0.4)), col="red")

  plot(square(c(-1,1)), main="reflect lines", type="n")
  points(0, 0, pch=3)
  L <- infline(p=c(0.7, 0.8), theta=pi* c(0.2, 0.6))
  plot(L, col="green")
  plot(reflect(L), col="red")




