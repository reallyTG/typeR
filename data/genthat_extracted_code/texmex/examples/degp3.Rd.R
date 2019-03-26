library(texmex)


### Name: degp3
### Title: Density, cumulative density, quantiles and random number
###   generation for the extended generalized Pareto distribution 3
### Aliases: degp3 pegp3 regp3
### Keywords: models

### ** Examples


  x <- regp3(1000, kappa=2, sigma=1, xi=.5)
  hist(x)
  x <- regp3(1000, kappa=2, sigma=exp(rnorm(1000, 1, .25)), xi=rnorm(1000, .5, .2))
  hist(x)
  plot(pegp3(x, kappa=2, sigma=1, xi=.5))




