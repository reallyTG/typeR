library(spatstat)


### Name: as.mask
### Title: Pixel Image Approximation of a Window
### Aliases: as.mask
### Keywords: spatial manip

### ** Examples

  w <- owin(c(0,10),c(0,10), poly=list(x=c(1,2,3,2,1), y=c(2,3,4,6,7)))
  ## Not run: plot(w)
  m <- as.mask(w)
  ## Not run: plot(m)
  x <- 1:9
  y <- seq(0.25, 9.75, by=0.5)
  m <- as.mask(w, xy=list(x=x, y=y))



