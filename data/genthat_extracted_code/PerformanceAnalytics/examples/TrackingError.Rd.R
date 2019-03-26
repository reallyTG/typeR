library(PerformanceAnalytics)


### Name: TrackingError
### Title: Calculate Tracking Error of returns against a benchmark
### Aliases: TrackingError

### ** Examples


data(managers)
TrackingError(managers[,1,drop=FALSE], managers[,8,drop=FALSE]) 
TrackingError(managers[,1:6], managers[,8,drop=FALSE]) 
TrackingError(managers[,1:6], managers[,8:7,drop=FALSE])




