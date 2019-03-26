library(rrcov)


### Name: CovControlSest
### Title: Constructor function for objects of class "CovControlSest"
### Aliases: CovControlSest
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlSest", bdp=0.4)
    ctrl2 <- CovControlSest(bdp=0.4)

    data(hbk)
    CovSest(hbk, control=ctrl1)



