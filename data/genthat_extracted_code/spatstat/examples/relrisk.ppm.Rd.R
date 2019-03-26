library(spatstat)


### Name: relrisk.ppm
### Title: Parametric Estimate of Spatially-Varying Relative Risk
### Aliases: relrisk.ppm
### Keywords: spatial models

### ** Examples

  fit <- ppm(chorley ~ marks * (x+y))
  rr <- relrisk(fit, relative=TRUE, control="lung", se=TRUE)
  plot(rr$estimate)
  plot(rr$SE)
  rrX <- relrisk(fit, at="points", relative=TRUE, control="lung")



