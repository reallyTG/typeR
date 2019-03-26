library(LogicReg)


### Name: eval.logreg
### Title: Evaluate a Logic Regression tree
### Aliases: eval.logreg
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.savefit1)
# myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 1000)
# logreg.savefit1 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21], 
#                type = 2, select = 1, ntrees = 2, anneal.control = myanneal)
tree1 <- eval.logreg(logreg.savefit1$model$trees[[1]], logreg.savefit1$binary)
tree2 <- eval.logreg(logreg.savefit1$model$trees[[2]], logreg.savefit1$binary)
alltrees <- eval.logreg(logreg.savefit1$model, logreg.savefit1$binary)



