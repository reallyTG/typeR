library(PerformanceAnalytics)


### Name: ActiveReturn
### Title: Active Premium or Active Return
### Aliases: ActiveReturn ActivePremium

### ** Examples


    data(managers)
    ActivePremium(managers[, "HAM1", drop=FALSE], managers[, "SP500 TR", drop=FALSE])
    ActivePremium(managers[,1,drop=FALSE], managers[,8,drop=FALSE])
    ActivePremium(managers[,1:6], managers[,8,drop=FALSE])
    ActivePremium(managers[,1:6], managers[,8:7,drop=FALSE])



