library(rerf)


### Name: RunFeatureImportanceCounts
### Title: Tabulate the unique feature combinations used in a single RerF
###   tree
### Aliases: RunFeatureImportanceCounts

### ** Examples

library(rerf)
X <- iris[, -5]
Y <- iris[[5]]
store.impurity <- TRUE
FUN <- RandMatContinuous
forest <- RerF(X, Y, FUN = FUN, num.cores = 1L, store.impurity = store.impurity)
FeatureImportance(forest, num.cores = 1L, type = "C")



