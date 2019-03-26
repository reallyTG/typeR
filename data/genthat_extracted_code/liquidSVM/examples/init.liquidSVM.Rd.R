library(liquidSVM)


### Name: init.liquidSVM
### Title: Initialize an SVM object.
### Aliases: init.liquidSVM init.liquidSVM.default, init.liquidSVM.formula
###   init.liquidSVM.formula init.liquidSVM.default

### ** Examples

modelTrees <- init.liquidSVM(Height ~ Girth + Volume, trees[1:20, ])  # least squares
modelIris <- init.liquidSVM(Species ~ ., iris)  # multiclass classification



