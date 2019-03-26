library(metaforest)


### Name: plot.MetaForest
### Title: Plots cumulative MSE for a MetaForest object.
### Aliases: plot.MetaForest

### ** Examples

## Don't show: 
set.seed(42)
data <- SimulateSMD()
#Conduct unweighted MetaForest analysis
mf.unif <- MetaForest(formula = yi ~ ., data = data$training,
                      whichweights = "unif", method = "DL")
plot(mf.unif)
## End(Don't show)



