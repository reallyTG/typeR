library(metaforest)


### Name: print.summary.MetaForest
### Title: Prints summary.MetaForest object.
### Aliases: print.summary.MetaForest

### ** Examples

## Don't show: 
set.seed(28)
data <- SimulateSMD()
mf.random <- MetaForest(formula = yi ~ ., data = data$training,
                      whichweights = "random")
print(summary(mf.random), digits = 3)
## End(Don't show)



