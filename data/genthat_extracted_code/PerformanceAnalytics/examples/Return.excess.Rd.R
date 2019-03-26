library(PerformanceAnalytics)


### Name: Return.excess
### Title: Calculates the returns of an asset in excess of the given risk
###   free rate
### Aliases: Return.excess

### ** Examples


data(managers)
head(Return.excess(managers[,1,drop=FALSE], managers[,10,drop=FALSE]))
head(Return.excess(managers[,1,drop=FALSE], .04/12))
head(Return.excess(managers[,1:6], managers[,10,drop=FALSE]))
head(Return.excess(managers[,1,drop=FALSE], managers[,8,drop=FALSE]))




