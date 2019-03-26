library(spatstat)


### Name: pairorient
### Title: Point Pair Orientation Distribution
### Aliases: pairorient
### Keywords: spatial nonparametric

### ** Examples

  rose(pairorient(redwood, 0.05, 0.15, sigma=8), col="grey")
  plot(CDF <- pairorient(redwood, 0.05, 0.15, cumulative=TRUE))
  plot(f <- deriv(CDF, spar=0.6, Dperiodic=TRUE))



