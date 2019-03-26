## ----setup, echo=FALSE---------------------------------------------------
library(knitr)
opts_chunk$set(message=FALSE)

## ------------------------------------------------------------------------
 library(ArchaeoChron)
    data(sunspot)
    MCMC1 = combination_Gauss(M=sunspot$Age[1:5], s= sunspot$Error[1:5], refYear=rep(2016,5), studyPeriodMin=900, studyPeriodMax=1500, variable.names = c('theta'))

## ------------------------------------------------------------------------
   library(coda)
   plot(MCMC1)
   gelman.diag(MCMC1)

## ------------------------------------------------------------------------
   library(ArchaeoPhases)
   MCMCSample1 = rbind(MCMC1[[1]], MCMC1[[2]])
   M1 = MarginalStatistics(MCMCSample1[,1], level = 0.95)
   M1
   MarginalPlot(MCMCSample1[,1], level = 0.95)

## ------------------------------------------------------------------------
    MCMC2 = combinationWithOutliers_Gauss(M=sunspot$Age[1:5], s= sunspot$Error[1:5], refYear=rep(2016,5), outliersIndivVariance = rep(1,5), outliersBernouilliProba=rep(0.2, 5), studyPeriodMin=800, studyPeriodMax=1500, variable.names = c('theta'))
    plot(MCMC2)

## ------------------------------------------------------------------------
   MCMCSample2 = rbind(MCMC2[[1]], MCMC2[[2]])
   M2 = MarginalStatistics(MCMCSample2[,1], level = 0.95)
   M2
   MarginalPlot(MCMCSample2[,1], level = 0.95)

## ------------------------------------------------------------------------
    MCMC3 = combinationWithRandomEffect_Gauss(M=sunspot$Age[1:5], s= sunspot$Error[1:5], refYear=rep(2016,5), studyPeriodMin=0, studyPeriodMax=1500, variable.names = c('theta'))
    plot(MCMC3)

## ------------------------------------------------------------------------
   MCMCSample3 = rbind(MCMC3[[1]], MCMC3[[2]])
   M3 = MarginalStatistics(MCMCSample3[,1], level = 0.95)
   M3
   MarginalPlot(MCMCSample3[,1], level = 0.95)

## ------------------------------------------------------------------------
    MCMC4 = eventModel_Gauss(M=sunspot$Age[1:5], s= sunspot$Error[1:5], refYear=rep(2016,5), studyPeriodMin=900, studyPeriodMax=1500, variable.names = c('theta', 'mu'))

## ------------------------------------------------------------------------
   plot(MCMC4)
   gelman.diag(MCMC4)

## ------------------------------------------------------------------------
   MCMCSample4 = rbind(MCMC4[[1]], MCMC4[[2]])
   M4 = MarginalStatistics(MCMCSample4[,6], level = 0.95)
   M4
   MarginalPlot(MCMCSample4[,6], level = 0.95)

