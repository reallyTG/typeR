library(LogicReg)


### Name: print.logreg
### Title: Prints Logic Regression Output
### Aliases: print.logreg
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.savefit1,logreg.savefit2,logreg.savefit3,logreg.savefit4,
     logreg.savefit5,logreg.savefit6)
#
# fit a single model
# myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 1000)
# logreg.savefit1 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21],
#                type = 2, select = 1, ntrees = 2, anneal.control = myanneal)
# the best score should be in the 0.96-0.98 range
print(logreg.savefit1)
#
# fit multiple models
# myanneal2 <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 0)
# logreg.savefit2 <- logreg(select = 2, ntrees = c(1,2), nleaves =c(1,7),
#                oldfit = logreg.savefit1, anneal.control = myanneal2)
print(logreg.savefit2)
# After an initial steep decline, the scores only get slightly better
# for models with more than four leaves and two trees.
#
# cross validation
# logreg.savefit3 <- logreg(select = 3, oldfit = logreg.savefit2)
print(logreg.savefit3)
# 4 leaves, 2 trees should give the best test set score
#
# null model test
# logreg.savefit4 <- logreg(select = 4, anneal.control = myanneal2, oldfit = logreg.savefit1)
print(logreg.savefit4)
# A summary of the permutation test
#
# Permutation tests
# logreg.savefit5 <- logreg(select = 5, oldfit = logreg.savefit2)
print(logreg.savefit5)
# A table summarizing the permutation tests
#
# a greedy sequence
# logreg.savefit6 <- logreg(select = 6, ntrees = 2, nleaves =c(1,12), oldfit = logreg.savefit1)
print(logreg.savefit6)



