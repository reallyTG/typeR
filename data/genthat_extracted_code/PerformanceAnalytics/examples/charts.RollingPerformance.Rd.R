library(PerformanceAnalytics)


### Name: charts.RollingPerformance
### Title: rolling performance chart
### Aliases: charts.RollingPerformance

### ** Examples


data(managers)
charts.RollingPerformance(managers[,1:8], 
                          Rf=managers[,10,drop=FALSE], 
                          colorset=tim8equal, 
                          main="Rolling 12-Month Performance", 
                          legend.loc="topleft")




