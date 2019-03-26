library(spatstat)


### Name: split.msr
### Title: Divide a Measure into Parts
### Aliases: split.msr
### Keywords: spatial manip

### ** Examples

  ## split by tessellation
  a <- residuals(ppm(cells ~ x))
  aa <- split(a, dirichlet(runifpoint(4)))
  aa
  sapply(aa, integral)

  ## split by type of point
  b <- residuals(ppm(amacrine ~ marks + x))
  bb <- split(b)
  bb



