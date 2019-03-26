library(spatstat)


### Name: area.owin
### Title: Area of a Window
### Aliases: area area.owin area.default volume.owin
### Keywords: spatial math

### ** Examples

  w <- unit.square()
  area(w)
       # returns 1.00000

  k <- 6
  theta <- 2 * pi * (0:(k-1))/k
  co <- cos(theta)
  si <- sin(theta)
  mas <- owin(c(-1,1), c(-1,1), poly=list(x=co, y=si))
  area(mas)
      # returns approx area of k-gon
  
  mas <- as.mask(square(2), eps=0.01)
  X <- raster.x(mas)
  Y <- raster.y(mas)
  mas$m <- ((X - 1)^2 + (Y - 1)^2 <= 1)
  area(mas)
       # returns 3.14 approx     




