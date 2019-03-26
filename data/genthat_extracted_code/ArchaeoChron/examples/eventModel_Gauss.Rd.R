library(ArchaeoChron)


### Name: eventModel_Gauss
### Title: Bayesian modeling for combining Gaussian dates using the Event
###   Model
### Aliases: eventModel_Gauss
### Keywords: Event Model Gaussian dates Combination of dates Random effect

### ** Examples

  data(sunspot)
  MCMC = eventModel_Gauss(M=sunspot$Age[1:10], s= sunspot$Error[1:10], refYear=rep(2016,10), 
  studyPeriodMin=900, studyPeriodMax=1500, variable.names = c('theta'))
  plot(MCMC)
  gelman.diag(MCMC)



