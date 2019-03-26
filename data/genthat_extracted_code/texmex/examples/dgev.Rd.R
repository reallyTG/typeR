library(texmex)


### Name: dgev
### Title: Density, cumulative density, quantiles and random number
###   generation for the generalized extreme value distribution
### Aliases: dgev pgev qgev rgev
### Keywords: models

### ** Examples


  x <- rgev(1000, mu=0, sigma=1, xi=.5)
  hist(x)
  x <- rgev(1000, mu=0, sigma=exp(rnorm(1000, 1, .25)), xi=rnorm(1000, .5, .2))
  hist(x)
  plot(pgev(x, mu=0, sigma=1, xi=.5))




