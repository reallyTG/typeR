library(PerformanceAnalytics)


### Name: CAPM.CML.slope
### Title: utility functions for single factor (CAPM) CML, SML, and
###   RiskPremium
### Aliases: CAPM.CML.slope CAPM.CML CAPM.RiskPremium CAPM.utils CAPM.CML
###   CAPM.CML.slope CAPM.SML.slope SFM.utils SFM.RiskPremium SFM.CML
###   SFM.CML.slope SFM.SML.slope CAPM.SML.slope

### ** Examples


data(managers)
CAPM.CML.slope(managers[,"SP500 TR",drop=FALSE], managers[,10,drop=FALSE])
CAPM.CML(managers[,"HAM1",drop=FALSE], managers[,"SP500 TR",drop=FALSE], Rf=0)
CAPM.RiskPremium(managers[,"SP500 TR",drop=FALSE], Rf=0)
CAPM.RiskPremium(managers[,"HAM1",drop=FALSE], Rf=0)
CAPM.SML.slope(managers[,"SP500 TR",drop=FALSE], Rf=0)
# should create plots like in Ruppert 7.1 7.2



