library(tbart)


### Name: mink.dists
### Title: Minkowski distances from a Spatial* or Spatial*DataFrame object
### Aliases: mink.dists

### ** Examples

data(meuse)
coordinates(meuse) <- ~x+y
d1 <- mink.dists(meuse,pwr=1,scale=1000)   # Taxicab metric
d2 <- mink.dists(meuse,pwr=Inf,scale=1000) # Works for limiting case



