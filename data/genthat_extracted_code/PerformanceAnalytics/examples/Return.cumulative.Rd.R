library(PerformanceAnalytics)


### Name: Return.cumulative
### Title: calculate a compounded (geometric) cumulative return
### Aliases: Return.cumulative

### ** Examples


data(managers)
Return.cumulative(managers[,1,drop=FALSE])
Return.cumulative(managers[,1:8])
Return.cumulative(managers[,1:8],geometric=FALSE)




