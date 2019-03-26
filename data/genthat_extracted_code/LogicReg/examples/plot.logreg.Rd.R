library(LogicReg)


### Name: plot.logreg
### Title: Plots for Logic Regression
### Aliases: plot.logreg
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.savefit1,logreg.savefit2,logreg.savefit3,logreg.savefit4,
     logreg.savefit5,logreg.savefit6,logreg.savefit7)
#
# fit a single model
# myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 1000)
# logreg.savefit1 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21],
#                type = 2, select = 1, ntrees = 2, anneal.control = myanneal)
# the best score should be in the 0.96-0.98 range
plot(logreg.savefit1)
#
# fit multiple models
# myanneal2 <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 0)
# logreg.savefit2 <- logreg(select = 2, ntrees = c(1,2), nleaves =c(1,7), 
#                oldfit = logreg.savefit1, anneal.control = myanneal2)
plot(logreg.savefit2)
# After an initial steep decline, the scores only get slightly better
# for models with more than four leaves and two trees. 
#
# cross validation
# logreg.savefit3 <- logreg(select = 3, oldfit = logreg.savefit2)
plot(logreg.savefit3)
# 4 leaves, 2 trees should give the best test set score
#
# null model test
# logreg.savefit4 <- logreg(select = 4, anneal.control = myanneal2, oldfit = logreg.savefit1)
plot(logreg.savefit4)
# A histogram of the 25 scores obtained from the permutation test. Also shown
# are the scores for the best scoring model with one logic tree, and the null
# model (no tree). As the permutation scores are not even close to the score
# of the best model with one tree (fit on the original data), there is strong
# evidence against the null hypothesis that there was no signal in the data. 
#
# Permutation tests
# logreg.savefit5 <- logreg(select = 5, oldfit = logreg.savefit2)
plot(logreg.savefit5)
# The permutation scores improve until we condition on a model with two
# trees and four leaves, and then do not change very much anymore. This 
# indicates that the best model has indeed four leaves.
#
# a greedy sequence
# logreg.savefit6 <- logreg(select = 6, ntrees = 2, nleaves =c(1,12), oldfit = logreg.savefit1)
plot(logreg.savefit6)
# Monte Carlo Logic Regression
# logreg.savefit7 <- logreg(select = 7, oldfit = logreg.savefit1, mc.control=
#                logreg.mc.control(nburn=1000, niter=100000, hyperpars=log(2)))
plot(logreg.savefit7)



