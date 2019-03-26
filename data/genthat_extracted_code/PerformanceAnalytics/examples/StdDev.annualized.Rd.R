library(PerformanceAnalytics)


### Name: StdDev.annualized
### Title: calculate a multiperiod or annualized Standard Deviation
### Aliases: StdDev.annualized sd.multiperiod sd.annualized

### ** Examples


    data(edhec)
    sd.annualized(edhec)
    sd.annualized(edhec[,6,drop=FALSE])
    # now for three periods:
    sd.multiperiod(edhec[,6,drop=FALSE],scale=3)




