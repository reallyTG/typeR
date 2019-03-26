library(dse)


### Name: toSS
### Title: Convert to State Space Model
### Aliases: toSS toSS.ARMA toSS.SS toSS.TSestModel toSSaugment
###   toSSaugment.ARMA toSSaugment.TSestModel toSSnested toSSnested.SS
###   toSSnested.ARMA toSSnested.TSestModel
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- estVARXls(eg1.DSE.data.diff)
model <- toSS(model)



