library(dse)


### Name: coef.TSmodel
### Title: Extract or set Model Parameters
### Aliases: coef.TSmodel coef.TSestModel coef<- coef<-.default
### Keywords: ts

### ** Examples

    data("eg1.DSE.data.diff", package="dse")
    model <- estVARXls(eg1.DSE.data.diff)
    coef(model)
    coef(model) <- 0.1 + coef(model)



