library(LogicReg)


### Name: plot.logregmodel
### Title: Plots for Logic Regression
### Aliases: plot.logregmodel
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.savefit1)
# myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 1000)
# logreg.savefit1 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21],
#                type = 2, select = 1, ntrees = 2, anneal.control = myanneal)
# plot(logreg.savefit1)
plot(logreg.savefit1$model) # does the same



