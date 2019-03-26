library(spatstat)


### Name: as.im
### Title: Convert to Pixel Image
### Aliases: as.im as.im.im as.im.leverage.ppm as.im.owin as.im.matrix
###   as.im.tess as.im.function as.im.funxy as.im.expression as.im.distfun
###   as.im.nnfun as.im.densityfun as.im.Smoothfun as.im.data.frame
###   as.im.default
### Keywords: spatial manip

### ** Examples

  data(demopat)
  # window object
  W <- Window(demopat)
  plot(W)
  Z <- as.im(W)
  image(Z)
  # function
  Z <- as.im(function(x,y) {x^2 + y^2}, unit.square())
  image(Z)
  # or as an expression
  Z <- as.im(expression(x^2+y^2), square(1))

  # function with extra arguments
  f <- function(x, y, x0, y0) {
      sqrt((x - x0)^2 + (y-y0)^2)
  }
  Z <- as.im(f, unit.square(), x0=0.5, y0=0.5)
  image(Z)

  # Revisit the Sixties
  Z <- as.im(f, letterR, x0=2.5, y0=2)
  image(Z)
  # usual convention in R
  stuff <- list(x=1:10, y=1:10, z=matrix(1:100, nrow=10))
  Z <- as.im(stuff)
  # convert to finer grid
  Z <- as.im(Z, dimyx=256)

  #' distance functions
  d <- distfun(redwood)
  Zapprox <- as.im(d)
  Zexact <- as.im(d, approx=FALSE)
  plot(solist(approx=Zapprox, exact=Zexact), main="")

  # pixellate the Dirichlet tessellation
  Di <- dirichlet(runifpoint(10))
  plot(as.im(Di))
  plot(Di, add=TRUE)

  # as.im.data.frame is the reverse of as.data.frame.im
  grad <- bei.extra$grad
  slopedata <- as.data.frame(grad)
  slope <- as.im(slopedata)
  unitname(grad) <- unitname(slope) <- unitname(grad) # for compatibility
  all.equal(slope, grad) # TRUE



