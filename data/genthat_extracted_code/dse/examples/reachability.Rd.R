library(dse)


### Name: reachability
### Title: Calculate Model Reachability Matrix
### Aliases: reachability reachability.ARMA reachability.SS
###   reachability.TSestModel
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- toSS(estVARXls(eg1.DSE.data.diff))
reachability(model)



