library(dse)


### Name: MittnikReduction
### Title: Balance and Reduce a Model
### Aliases: MittnikReduction MittnikReduction.from.Hankel
### Keywords: ts

### ** Examples

    data("egJofF.1dec93.data", package="dse")
    model <- toSS(estVARXls(egJofF.1dec93.data))
    newmodel <-MittnikReduction(model, criterion="taic")



