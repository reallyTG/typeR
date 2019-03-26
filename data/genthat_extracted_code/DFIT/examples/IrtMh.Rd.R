library(DFIT)


### Name: IrtMh
### Title: Calculates the Mantel-Haenszel theoretical parameter when a
###   dichotomous IRT model holds
### Aliases: IrtMh

### ** Examples


data(dichotomousItemParameters)
threePlMh <- IrtMh(itemParameters = dichotomousItemParameters,  irtModel = "3pl",
                   focalDistribution = "norm", referenceDistribution = "norm",
                   focalDistrExtra = list(mean = 0, sd = 1),
                   referenceDistrExtra = list(mean = 0, sd = 1), groupRatio = 1,
                   logistic = FALSE)




