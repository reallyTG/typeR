library(LogicReg)


### Name: print.logregmodel
### Title: Prints Logic Regression Formula
### Aliases: print.logregmodel
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.savefit1)
#
# myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 1000)
# logreg.savefit1 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21],
#                type = 2, select = 1, ntrees = 2, anneal.control = myanneal)
print(logreg.savefit1$model) 



