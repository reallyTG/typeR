library(dse)


### Name: l
### Title: Evaluate a TSmodel
### Aliases: l l.TSdata l.TSestModel
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- toSS(TSmodel(estVARXls(eg1.DSE.data.diff)))
evaluated.model <- l(model, eg1.DSE.data.diff)



