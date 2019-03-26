library(rrcov)


### Name: CovControlMcd
### Title: Constructor function for objects of class "CovControlMcd"
### Aliases: CovControlMcd
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlMcd", alpha=0.75)
    ctrl2 <- CovControlMcd(alpha=0.75)

    data(hbk)
    CovMcd(hbk, control=ctrl1)



