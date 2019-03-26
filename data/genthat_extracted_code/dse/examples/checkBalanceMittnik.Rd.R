library(dse)


### Name: checkBalanceMittnik
### Title: Check Balance of a TSmodel
### Aliases: checkBalanceMittnik checkBalanceMittnik.ARMA
###   checkBalanceMittnik.SS checkBalanceMittnik.TSestModel
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    model <- toSS(estVARXls(eg1.DSE.data.diff))
    checkBalanceMittnik(model)



