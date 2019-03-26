library(dse)


### Name: forecastCov
### Title: Forecast covariance for different models
### Aliases: forecastCov forecastCov.TSdata forecastCov.TSmodel
###   forecastCov.TSestModel is.forecastCov
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    model1 <- estVARXar(eg1.DSE.data.diff)
    model2 <- estVARXls(eg1.DSE.data.diff)
    z <-  forecastCov(model1, model2, data=trimNA(eg1.DSE.data.diff))
    is.forecastCov(z)



