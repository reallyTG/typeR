library(dse)


### Name: fixConstants
### Title: Fix TSmodel Coefficients (Parameters) to Constants
### Aliases: fixConstants
### Keywords: ts

### ** Examples

    f <- array(c(.5,.3,.2,.4),c(2,2))
    h <- array(c(1,0,0,1),c(2,2))
    k <- array(c(.5,.3,.2,.4),c(2,2))
    ss <- SS(F=f,G=NULL,H=h,K=k)
    ss
    coef(ss)
    ss <- fixConstants(ss, constants=list(
              F = matrix(c(TRUE, FALSE, FALSE, FALSE), 2,2)))
    ss
    coef(ss)
    data("eg1.DSE.data.diff", package="dse")
    model <- toARMA(toSS(estVARXls(eg1.DSE.data.diff)))
    model <- fixConstants(model)



