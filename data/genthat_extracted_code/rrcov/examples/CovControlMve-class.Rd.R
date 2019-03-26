library(rrcov)


### Name: CovControlMve-class
### Title: Class 'CovControlMve' - contains control parameters for CovMve
### Aliases: CovControlMve-class restimate,CovControlMve-method
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlMve", alpha=0.75)
    ctrl2 <- CovControlMve(alpha=0.75)

    data(hbk)
    CovMve(hbk, control=ctrl1)



