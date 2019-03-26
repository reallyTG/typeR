library(PerformanceAnalytics)


### Name: CAPM.dynamic
### Title: Time-varying conditional single factor model beta
### Aliases: CAPM.dynamic SFM.dynamic

### ** Examples


data(managers)
CAPM.dynamic(managers[,1,drop=FALSE], managers[,8,drop=FALSE], 
             Rf=.035/12, Z=managers[, 9:10])

CAPM.dynamic(managers[80:120,1:6], managers[80:120,7,drop=FALSE], 
             Rf=managers[80:120,10,drop=FALSE], Z=managers[80:120, 9:10])
             
CAPM.dynamic(managers[80:120,1:6], managers[80:120,8:7],
              managers[80:120,10,drop=FALSE], Z=managers[80:120, 9:10])




