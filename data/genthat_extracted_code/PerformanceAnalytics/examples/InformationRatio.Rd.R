library(PerformanceAnalytics)


### Name: InformationRatio
### Title: InformationRatio = ActivePremium/TrackingError
### Aliases: InformationRatio

### ** Examples


data(managers)
InformationRatio(managers[,"HAM1",drop=FALSE], managers[, "SP500 TR", drop=FALSE])
InformationRatio(managers[,1:6], managers[,8,drop=FALSE])
InformationRatio(managers[,1:6], managers[,8:7])




