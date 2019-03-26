library(TeachingDemos)


### Name: vis.test
### Title: Do a Visual test of a null hypothesis by choosing the graph that
###   does not belong.
### Aliases: vis.test vt.qqnorm vt.normhist vt.scatterpermute vt.tspermute
###   vt.residpermute vt.residsim
### Keywords: hplot datagen htest

### ** Examples


if(interactive()) {
  x <- rexp(25, 1/3)
  vis.test(x, vt.qqnorm)

  x <- rnorm(100, 50, 3)
  vis.test(x, vt.normhist)
}




