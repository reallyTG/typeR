library(rrcov)


### Name: CovControlSde
### Title: Constructor function for objects of class "CovControlSde"
### Aliases: CovControlSde
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlSde", nsamp=2000)
    ctrl2 <- CovControlSde(nsamp=2000)

    data(hbk)
    CovSde(hbk, control=ctrl1)



