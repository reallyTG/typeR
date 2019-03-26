library(rrcov)


### Name: CovControlMcd-class
### Title: Class 'CovControlMcd' - contains control parameters for CovMcd
### Aliases: CovControlMcd-class restimate,CovControlMcd-method
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlMcd", alpha=0.75)
    ctrl2 <- CovControlMcd(alpha=0.75)

    data(hbk)
    CovMcd(hbk, control=ctrl1)



