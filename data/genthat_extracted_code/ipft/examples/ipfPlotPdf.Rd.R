library(ipft)


### Name: ipfPlotPdf
### Title: Plots the probability density function of the estimated error
### Aliases: ipfPlotPdf

### ** Examples


    model <- ipfKnn(ipftrain[, 1:168], ipftrain[, 169:170])
    estimation <- ipfEstimate(model, ipftest[, 1:168], ipftest[, 169:170])
    ipfPlotPdf(estimation)




