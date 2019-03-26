library(dse)


### Name: stability
### Title: Calculate Stability of a TSmodel
### Aliases: stability stability.ARMA stability.roots stability.TSmodel
###   stability.TSestModel
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
stability(model)



