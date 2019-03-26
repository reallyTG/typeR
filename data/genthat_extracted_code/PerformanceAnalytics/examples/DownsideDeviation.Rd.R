library(PerformanceAnalytics)


### Name: DownsideDeviation
### Title: downside risk (deviation, variance) of the return distribution
### Aliases: DownsideDeviation SemiDeviation SemiVariance DownsidePotential
###   DownsidePotential SemiDeviation SemiVariance

### ** Examples


#with data used in Bacon 2008

data(portfolio_bacon)
MAR = 0.005
DownsideDeviation(portfolio_bacon[,1], MAR) #expected 0.0255
DownsidePotential(portfolio_bacon[,1], MAR) #expected 0.0137

#with data of managers

data(managers)
apply(managers[,1:6], 2, sd, na.rm=TRUE)
DownsideDeviation(managers[,1:6])  # MAR 0%
DownsideDeviation(managers[,1:6], MAR = .04/12) #MAR 4%
SemiDeviation(managers[,1,drop=FALSE])
SemiDeviation(managers[,1:6])
SemiVariance (managers[,1,drop=FALSE])
SemiVariance (managers[,1:6]) #calculated using method="subset"




