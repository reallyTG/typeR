library(rrcov)


### Name: CovControlSde-class
### Title: Class 'CovControlSde' - contains control parameters for "CovSde"
### Aliases: CovControlSde-class restimate,CovControlSde-method
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlSde", nsamp=2000)
    ctrl2 <- CovControlSde(nsamp=2000)

    data(hbk)
    CovSde(hbk, control=ctrl1)



