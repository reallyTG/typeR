library(dse)


### Name: l.ARMA
### Title: Evaluate an ARMA TSmodel
### Aliases: l.ARMA
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    model <- TSmodel(estVARXls(eg1.DSE.data.diff))
    evaluated.model <- l(model,eg1.DSE.data.diff)



