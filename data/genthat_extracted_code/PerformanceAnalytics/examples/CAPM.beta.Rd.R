library(PerformanceAnalytics)


### Name: CAPM.beta
### Title: calculate single factor model (CAPM) beta
### Aliases: CAPM.beta CAPM.beta.bull CAPM.beta.bear TimingRatio SFM.beta
###   CAPM.beta.bull CAPM.beta.bear TimingRatio

### ** Examples


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
    CAPM.beta(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE])
    CAPM.beta.bull(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE])
    CAPM.beta.bear(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE])
    TimingRatio(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE])
    chart.Regression(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE], 
			fit="conditional", 
			main="Conditional Beta")
  		



