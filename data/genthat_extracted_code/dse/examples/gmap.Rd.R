library(dse)


### Name: gmap
### Title: Basis Transformation of a Model.
### Aliases: gmap
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
model <- toSS(estVARXls(eg1.DSE.data.diff))
gmap(2, model)



