library(rrcov)


### Name: CovControlMMest-class
### Title: Class 'CovControlMMest' - contains control parameters for
###   "CovMMest"
### Aliases: CovControlMMest-class restimate,CovControlMMest-method
### Keywords: classes robust multivariate

### ** Examples


    ## the following two statements are equivalent
    ctrl1 <- new("CovControlMMest", bdp=0.25)
    ctrl2 <- CovControlMMest(bdp=0.25)

    data(hbk)
    CovMMest(hbk, control=ctrl1)




