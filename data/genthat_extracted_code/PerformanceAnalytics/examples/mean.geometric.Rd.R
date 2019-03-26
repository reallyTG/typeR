library(PerformanceAnalytics)


### Name: mean.geometric
### Title: calculate attributes relative to the mean of the observation
###   series given, including geometric, stderr, LCL and UCL
### Aliases: mean.geometric mean.utils mean.UCL mean.LCL mean.stderr
###   mean.stderr mean.LCL mean.UCL

### ** Examples


data(edhec)
mean.geometric(edhec[,"Funds of Funds"])
mean.stderr(edhec[,"Funds of Funds"])
mean.UCL(edhec[,"Funds of Funds"])
mean.LCL(edhec[,"Funds of Funds"])



