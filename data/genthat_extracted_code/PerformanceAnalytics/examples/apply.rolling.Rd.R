library(PerformanceAnalytics)


### Name: apply.rolling
### Title: calculate a function over a rolling window
### Aliases: apply.rolling

### ** Examples


data(managers)
apply.rolling(managers[,1,drop=FALSE], FUN="mean", width=36)




