library(PerformanceAnalytics)


### Name: CoMoments
### Title: Functions for calculating comoments of financial time series
### Aliases: CoMoments CoSkewnessMatrix CoKurtosisMatrix CoMoments
###   CoVariance CoSkewness CoKurtosis CoSkewness CoKurtosis M3.MM M4.MM

### ** Examples


data(managers)
CoVariance(managers[, "HAM2", drop=FALSE], managers[, "SP500 TR", drop=FALSE])
CoSkewness(managers[, "HAM2", drop=FALSE], managers[, "SP500 TR", drop=FALSE])
CoKurtosis(managers[, "HAM2", drop=FALSE], managers[, "SP500 TR", drop=FALSE])




