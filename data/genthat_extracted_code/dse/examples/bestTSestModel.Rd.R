library(dse)


### Name: bestTSestModel
### Title: Select Best Model
### Aliases: bestTSestModel
### Keywords: ts

### ** Examples

data("eg1.DSE.data.diff", package="dse")
models <- list(estVARXls(eg1.DSE.data.diff), estVARXar(eg1.DSE.data.diff))
z <-  bestTSestModel(models)



