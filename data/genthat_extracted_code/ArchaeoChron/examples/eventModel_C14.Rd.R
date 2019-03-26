library(ArchaeoChron)


### Name: eventModel_C14
### Title: Bayesian modeling for combining radiocarbon dates using the
###   Event Model
### Aliases: eventModel_C14
### Keywords: Combination of dates Random effect Event Model Radiocarbon
###   dates

### ** Examples

  data(cuers)
  MCMC = eventModel_C14(M=cuers$Age, s=cuers$Error, calibCurve = 'intcal13', 
  studyPeriodMin = 1000, studyPeriodMax = 2000, variable.names = c('theta'), numberAdapt = 1000, 
  numberUpdate = 1000, numberSample = 3000)
  plot(MCMC)



