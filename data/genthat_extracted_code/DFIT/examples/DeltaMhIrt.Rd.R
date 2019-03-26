library(DFIT)


### Name: DeltaMhIrt
### Title: Obtains the ETS Delta measure for Mantel-Haneszel DIF statistic
###   effect size.
### Aliases: DeltaMhIrt

### ** Examples


data(dichotomousItemParameters)
threePlMh <- IrtMh(itemParameters = dichotomousItemParameters,  irtModel = "3pl",
                   focalDistribution = "norm",
                   referenceDistribution = "norm", focalDistrExtra = list(mean = 0, sd = 1),
                   referenceDistrExtra = list(mean = 0, sd = 1), groupRatio = 1,
                   logistic = FALSE)
delta3pl <- DeltaMhIrt(threePlMh)




