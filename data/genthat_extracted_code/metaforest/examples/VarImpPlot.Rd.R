library(metaforest)


### Name: VarImpPlot
### Title: Plots variable importance for a MetaForest object.
### Aliases: VarImpPlot

### ** Examples

set.seed(42)
data <- SimulateSMD()
mf.random <- MetaForest(formula = yi ~ ., data = data$training,
                        whichweights = "random", method = "DL",
                        tau2 = 0.0116)
VarImpPlot(mf.random)
VarImpPlot(mf.random, n.var = 2)
VarImpPlot(mf.random, sort = FALSE)



