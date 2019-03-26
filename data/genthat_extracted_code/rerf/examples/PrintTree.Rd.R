library(rerf)


### Name: PrintTree
### Title: RerF Tree Printer
### Aliases: PrintTree

### ** Examples

### Train RerF on numeric data ###
library(rerf)
numTree <- 1
forest <- RerF(as.matrix(iris[, 1:4]), iris[, 5], num.core = 1L)
forest.rmc <- RerF(as.matrix(iris[, 1:4]), iris[, 5], num.core = 1L, RandMatContinuous)
(out <- PrintTree(forest, numTree))
(out.rmc <- PrintTree(forest.rmc, numTree))




