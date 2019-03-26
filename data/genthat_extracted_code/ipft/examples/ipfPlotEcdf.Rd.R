library(ipft)


### Name: ipfPlotEcdf
### Title: Plots the cumulative distribution function of the estimated
###   error
### Aliases: ipfPlotEcdf

### ** Examples


    model <- ipfKnn(ipftrain[, 1:168], ipftrain[, 169:170])
    estimation <- ipfEstimate(model, ipftest[, 1:168], ipftest[, 169:170])
    ipfPlotEcdf(estimation)




