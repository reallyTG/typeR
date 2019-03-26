library(PerformanceAnalytics)


### Name: CAPM.alpha
### Title: calculate single factor model (CAPM) alpha
### Aliases: CAPM.alpha SFM.alpha

### ** Examples


# First we load the data
    data(managers)
    CAPM.alpha(managers[,1,drop=FALSE], 
			managers[,8,drop=FALSE], 
			Rf=.035/12) 
    CAPM.alpha(managers[,1,drop=FALSE], 
			managers[,8,drop=FALSE], 
			Rf = managers[,10,drop=FALSE])
    CAPM.alpha(managers[,1:6], 
			managers[,8,drop=FALSE], 
			Rf=.035/12)
    CAPM.alpha(managers[,1:6], 
			managers[,8,drop=FALSE], 
			Rf = managers[,10,drop=FALSE])
    CAPM.alpha(managers[,1:6], 
			managers[,8:7,drop=FALSE], 
			Rf=.035/12) 
    CAPM.alpha(managers[,1:6], 
			managers[,8:7,drop=FALSE], 
			Rf = managers[,10,drop=FALSE])
  		



