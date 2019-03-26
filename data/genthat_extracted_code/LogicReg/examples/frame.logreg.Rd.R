library(LogicReg)


### Name: frame.logreg
### Title: Constructs a data frame for one or more Logic Regression models
### Aliases: frame.logreg
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.savefit1,logreg.savefit2,logreg.savefit6)
#
# fit a single mode
# myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 1000)
# logreg.savefit1 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21], 
#               type = 2, select = 1, ntrees = 2, anneal.control = myanneal)
frame1 <- frame.logreg(logreg.savefit1)
#
# a complete sequence
# myanneal2 <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 0)
# logreg.savefit2 <- logreg(select = 2, ntrees = c(1,2), nleaves =c(1,7), 
#               oldfit = logreg.savefit1, anneal.control = myanneal2)
frame2 <- frame.logreg(logreg.savefit2)
#
# a greedy sequence
# logreg.savefit6 <- logreg(select = 6, ntrees = 2, nleaves =c(1,12), oldfit = logreg.savefit1)
frame6  <- frame.logreg(logreg.savefit6, msz = 3:5) # restrict the size




