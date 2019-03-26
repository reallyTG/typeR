library(rrcov)


### Name: CovControlOgk
### Title: Constructor function for objects of class "CovControlOgk"
### Aliases: CovControlOgk
### Keywords: classes robust multivariate

### ** Examples

    ## the following two statements are equivalent
    ctrl1 <- new("CovControlOgk", beta=0.95)
    ctrl2 <- CovControlOgk(beta=0.95)

    data(hbk)
    CovOgk(hbk, control=ctrl1)



