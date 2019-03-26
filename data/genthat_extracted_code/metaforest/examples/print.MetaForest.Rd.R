library(metaforest)


### Name: print.MetaForest
### Title: Prints MetaForest object.
### Aliases: print.MetaForest

### ** Examples

## Don't show: 
set.seed(11)
data <- SimulateSMD()
mf.fixed <- MetaForest(formula = yi ~ ., data = data$training,
                      whichweights = "fixed")
mf.fixed
## End(Don't show)



