library(PerformanceAnalytics)


### Name: UpsidePotentialRatio
### Title: calculate Upside Potential Ratio of upside performance over
###   downside risk
### Aliases: UpsidePotentialRatio UPR

### ** Examples


data(edhec)
UpsidePotentialRatio(edhec[, 6], MAR=.05/12) #5 percent/yr MAR
UpsidePotentialRatio(edhec[, 1:6], MAR=0)



