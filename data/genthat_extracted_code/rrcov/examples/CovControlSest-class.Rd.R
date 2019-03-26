library(rrcov)


### Name: CovControlSest-class
### Title: Class 'CovControlSest' - contains control parameters for
###   "CovSest"
### Aliases: CovControlSest-class restimate,CovControlSest-method
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlSest", bdp=0.4)
    ctrl2 <- CovControlSest(bdp=0.4)

    data(hbk)
    CovSest(hbk, control=ctrl1)




