library(ArchaeoChron)


### Name: combinationWithOutliers_Gauss
### Title: Bayesian modeling for combining Gaussian dates and handling
###   outliers
### Aliases: combinationWithOutliers_Gauss
### Keywords: Combination of dates Gaussian dates Outliers

### ** Examples

  data(sunspot)
  MCMC1 = combinationWithOutliers_Gauss(M=sunspot$Age[1:10], s= sunspot$Error[1:10], 
  refYear=rep(2016,10), outliersIndivVariance = rep(1,10), 
  outliersBernouilliProba=rep(0.2, 10), studyPeriodMin=800, studyPeriodMax=1500, 
  variable.names = c('theta'))
  plot(MCMC1)
  gelman.diag(MCMC1)
  
  # Influence of outliersIndivVariance
  MCMC2 = combinationWithOutliers_Gauss(M=sunspot$Age[1:10], s= sunspot$Error[1:10], 
  refYear=rep(2016,10), outliersIndivVariance = rep(10,10), 
  outliersBernouilliProba=rep(0.2, 10), studyPeriodMin=800, studyPeriodMax=1500, 
  variable.names = c('theta'))
  plot(MCMC2)
  gelman.diag(MCMC2)  




