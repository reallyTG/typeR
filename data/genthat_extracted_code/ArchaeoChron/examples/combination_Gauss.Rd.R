library(ArchaeoChron)


### Name: combination_Gauss
### Title: Bayesian modeling for combining Gaussian dates
### Aliases: combination_Gauss
### Keywords: Combination of dates Gaussian dates

### ** Examples

  data(sunspot)
  MCMC = combination_Gauss(M=sunspot$Age[1:10], s= sunspot$Error[1:10], refYear=rep(2016,10), 
  studyPeriodMin=900, studyPeriodMax=1500, variable.names = c('theta'))
  plot(MCMC)
  gelman.diag(MCMC)



