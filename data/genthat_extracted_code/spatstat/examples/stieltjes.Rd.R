library(spatstat)


### Name: stieltjes
### Title: Compute Integral of Function Against Cumulative Distribution
### Aliases: stieltjes
### Keywords: spatial math

### ** Examples

  # estimate cdf of nearest neighbour distance in redwood data
  G <- Gest(redwood)
  # compute estimate of mean nearest neighbour distance
  stieltjes(function(x){x}, G)
  # estimated probability of a distance in the interval [0.1,0.2]
  stieltjes(function(x,a,b){ (x >= a) & (x <= b)}, G, a=0.1, b=0.2)

  # stepfun example
  H <- spatialcdf(bei.extra$elev, normalise=TRUE)
  stieltjes(function(x){x}, H)



