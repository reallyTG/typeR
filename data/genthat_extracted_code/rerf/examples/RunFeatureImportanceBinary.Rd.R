library(rerf)


### Name: RunFeatureImportanceBinary
### Title: Compute Feature Importance of a single RerF tree
### Aliases: RunFeatureImportanceBinary

### ** Examples

library(rerf)
X <- iris[, -5]
Y <- iris[[5]]
store.impurity <- TRUE
FUN <- RandMatBinary
forest <- RerF(X, Y, FUN = FUN, num.cores = 1L, store.impurity = store.impurity)
FeatureImportance(forest, num.cores = 1L)



