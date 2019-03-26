library(rrcov)


### Name: CovControlMve
### Title: Constructor function for objects of class "CovControlMve"
### Aliases: CovControlMve
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlMve", alpha=0.75)
    ctrl2 <- CovControlMve(alpha=0.75)

    data(hbk)
    CovMve(hbk, control=ctrl1)



