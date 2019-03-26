library(spatstat)


### Name: with.ssf
### Title: Evaluate Expression in a Spatially Sampled Function
### Aliases: with.ssf apply.ssf
### Keywords: spatial manip programming

### ** Examples

  a <- ssf(cells, data.frame(d=nndist(cells), i=1:npoints(cells)))
  with(a, i/d)



