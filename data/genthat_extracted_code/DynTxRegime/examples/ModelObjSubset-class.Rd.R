library(DynTxRegime)


### Name: ModelObjSubset-class
### Title: Class '"ModelObjSubset"'
### Aliases: ModelObjSubset-class
### Keywords: internal

### ** Examples

showClass("ModelObjSubset")

subsetModel <- buildModelObjSubset(model  = ~ x1, 
                                   solver.method = 'lm', 
                                   subset = 'example', 
                                   dp = 1)

DynTxRegime:::.getDecisionPoint(subsetModel)
DynTxRegime:::.getSubset(subsetModel)
DynTxRegime:::.getModelObj(subsetModel)



