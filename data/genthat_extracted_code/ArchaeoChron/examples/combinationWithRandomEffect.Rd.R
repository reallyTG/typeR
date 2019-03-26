library(ArchaeoChron)


### Name: combinationWithRandomEffect_Gauss
### Title: Bayesian modeling for combining Gaussian dates with a random
###   effect
### Aliases: combinationWithRandomEffect_Gauss
### Keywords: Combination of dates Gaussian dates Random effect

### ** Examples

  data(sunspot)
  MCMC = combinationWithRandomEffect_Gauss(M=sunspot$Age[1:10], s= sunspot$Error[1:10], 
  refYear=rep(2016,10), studyPeriodMin=0, studyPeriodMax=1500, variable.names = c('theta'))
  plot(MCMC)
  gelman.diag(MCMC)



