library(rrcov)


### Name: CovControlMest
### Title: Constructor function for objects of class "CovControlMest"
### Aliases: CovControlMest
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlMest", r=0.4)
    ctrl2 <- CovControlMest(r=0.4)

    data(hbk)
    CovMest(hbk, control=ctrl1)



