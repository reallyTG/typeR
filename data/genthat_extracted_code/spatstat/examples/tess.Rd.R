library(spatstat)


### Name: tess
### Title: Create a Tessellation
### Aliases: tess
### Keywords: spatial datagen

### ** Examples

  A <- tess(xgrid=0:4,ygrid=0:4)
  A
  plot(A)
  B <- A[c(1, 2, 5, 7, 9)]
  B
  v <- as.im(function(x,y){factor(round(5 * (x^2 + y^2)))}, W=owin())
  levels(v) <- letters[seq(length(levels(v)))]
  E <- tess(image=v)
  plot(E)
  G <- tess(image=v, marks=toupper(levels(v)), unitname="km")
  G



