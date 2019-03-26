library(ipft)


### Name: ipfPlotEstimation
### Title: Plots the estimated locations
### Aliases: ipfPlotEstimation

### ** Examples


    model      <- ipfKnn(ipftrain[, 1:168], ipftrain[, 169:170])
    estimation <- ipfEstimate(model, ipftest[, 1:168], ipftest[, 169:170])
    ipfPlotEstimation(model, estimation, ipftest[, 169:170],
                      observations = seq(7,10), showneighbors = TRUE,
                      reverseAxis = TRUE)




