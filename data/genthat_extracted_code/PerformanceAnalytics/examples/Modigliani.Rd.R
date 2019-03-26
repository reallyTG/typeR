library(PerformanceAnalytics)


### Name: Modigliani
### Title: Modigliani-Modigliani measure
### Aliases: Modigliani

### ** Examples


data(managers)
Modigliani(managers[,1,drop=FALSE], managers[,8,drop=FALSE], Rf=.035/12)
Modigliani(managers[,1:6], managers[,8,drop=FALSE], managers[,8,drop=FALSE])
Modigliani(managers[,1:6], managers[,8:7], managers[,8,drop=FALSE])




