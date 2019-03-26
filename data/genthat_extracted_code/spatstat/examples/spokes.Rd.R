library(spatstat)


### Name: spokes
### Title: Spokes pattern of dummy points
### Aliases: spokes
### Keywords: spatial datagen

### ** Examples

  dat <- runifrect(10)
  dum <- spokes(dat$x, dat$y, 5, 3, 0.7)
  plot(dum)
  Q <- quadscheme(dat, dum, method="dirichlet")
  plot(Q, tiles=TRUE)



