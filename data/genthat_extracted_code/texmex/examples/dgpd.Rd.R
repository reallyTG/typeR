library(texmex)


### Name: dgpd
### Title: Density, cumulative density, quantiles and random number
###   generation for the generalized Pareto distribution
### Aliases: dgpd pgpd qgpd rgpd
### Keywords: models

### ** Examples


  x <- rgpd(1000, sigma=1, xi=.5)
  hist(x)
  x <- rgpd(1000, sigma=exp(rnorm(1000, 1, .25)), xi=rnorm(1000, .5, .2))
  hist(x)
  plot(pgpd(x, sigma=1, xi=.5))




