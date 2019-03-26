library(PerformanceAnalytics)


### Name: KellyRatio
### Title: calculate Kelly criterion ratio (leverage or bet size) for a
###   strategy
### Aliases: KellyRatio

### ** Examples


    data(managers)
    KellyRatio(managers[,1,drop=FALSE], Rf=.04/12)
    KellyRatio(managers[,1,drop=FALSE], Rf=managers[,10,drop=FALSE])
    KellyRatio(managers[,1:6], Rf=managers[,10,drop=FALSE])




