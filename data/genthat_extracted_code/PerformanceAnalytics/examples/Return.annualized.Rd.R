library(PerformanceAnalytics)


### Name: Return.annualized
### Title: calculate an annualized return for comparing instruments with
###   different length history
### Aliases: Return.annualized

### ** Examples


data(managers)
Return.annualized(managers[,1,drop=FALSE])
Return.annualized(managers[,1:8])
Return.annualized(managers[,1:8],geometric=FALSE)




