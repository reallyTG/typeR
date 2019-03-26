library(dse)


### Name: toARMA
### Title: Convert to an ARMA Model
### Aliases: toARMA toARMA.ARMA toARMA.SS toARMA.TSestModel
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- toSS(estVARXls(eg1.DSE.data.diff))
model <- toARMA(model)



