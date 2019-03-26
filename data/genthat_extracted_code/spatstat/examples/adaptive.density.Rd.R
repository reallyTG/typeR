library(spatstat)


### Name: adaptive.density
### Title: Intensity Estimate of Point Pattern Using Tessellation
### Aliases: adaptive.density
### Keywords: spatial methods smooth

### ** Examples

  plot(adaptive.density(nztrees, 1), main="Voronoi estimate")
  nr <- if(interactive()) 100 else 5
  plot(adaptive.density(nztrees, nrep=nr), main="Adaptive estimate")



