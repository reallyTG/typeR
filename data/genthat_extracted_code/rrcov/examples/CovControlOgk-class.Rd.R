library(rrcov)


### Name: CovControlOgk-class
### Title: Class 'CovControlOgk' - contains control parameters for CovOgk
### Aliases: CovControlOgk-class restimate,CovControlOgk-method
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlOgk", beta=0.95)
    ctrl2 <- CovControlOgk(beta=0.95)

    data(hbk)
    CovOgk(hbk, control=ctrl1)



