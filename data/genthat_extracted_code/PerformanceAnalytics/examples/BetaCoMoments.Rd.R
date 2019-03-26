library(PerformanceAnalytics)


### Name: BetaCoMoments
### Title: Functions to calculate systematic or beta co-moments of return
###   series
### Aliases: BetaCoMoments BetaCoVariance BetaCoSkewness BetaCoKurtosis
###   BetaCoSkewness BetaCoKurtosis

### ** Examples


data(managers)

BetaCoVariance(managers[, "HAM2", drop=FALSE], managers[, "SP500 TR", drop=FALSE])
BetaCoSkewness(managers[, "HAM2", drop=FALSE], managers[, "SP500 TR", drop=FALSE])
BetaCoKurtosis(managers[, "HAM2", drop=FALSE], managers[, "SP500 TR", drop=FALSE])
BetaCoKurtosis(managers[,1:6], managers[,8,drop=FALSE])
BetaCoKurtosis(managers[,1:6], managers[,8:7])




