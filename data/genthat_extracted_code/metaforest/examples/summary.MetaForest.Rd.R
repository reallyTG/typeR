library(metaforest)


### Name: summary.MetaForest
### Title: Summarize MetaForest object.
### Aliases: summary.MetaForest

### ** Examples

## Don't show: 
set.seed(64)
data <- SimulateSMD()
sum <- summary(mf.random <- MetaForest(formula = yi ~ .,
               data = data$training, whichweights = "random"), digits = 5)
sum
## End(Don't show)



