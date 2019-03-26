library(PerformanceAnalytics)


### Name: apply.fromstart
### Title: calculate a function over an expanding window always starting
###   from the beginning of the series
### Aliases: apply.fromstart

### ** Examples


data(managers)
apply.fromstart(managers[,1,drop=FALSE], FUN="mean", width=36)




