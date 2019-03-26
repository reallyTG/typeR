library(LogicReg)


### Name: logreg
### Title: Logic Regression
### Aliases: logreg
### Keywords: logic methods nonparametric tree

### ** Examples

data(logreg.savefit1,logreg.savefit2,logreg.savefit3,logreg.savefit4,
     logreg.savefit5,logreg.savefit6,logreg.savefit7,logreg.testdat)

myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 500, update = 100)
# in practie we would use 25000 iterations or far more - the use of 500 is only
# to have the examples run fast
## Not run: myanneal <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 500)
fit1 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21], type = 2,
               select = 1, ntrees = 2, anneal.control = myanneal)
# the best score should be in the 0.95-1.10 range
plot(fit1)
# you'll probably see X1-X4 as well as a few noise predictors
# use logreg.savefit1 for the results with 25000 iterations
 plot(logreg.savefit1)
 print(logreg.savefit1)
 z <- predict(logreg.savefit1)
 plot(z, logreg.testdat[,1]-z, xlab="fitted values", ylab="residuals")
# there are some streaks, thanks to the very discrete predictions
#
# a bit less output
 myanneal2 <- logreg.anneal.control(start = -1, end = -4, iter = 500, update = 0)
# in practie we would use 25000 iterations or more - the use of 500 is only 
# to have the examples run fast
## Not run: myanneal2 <- logreg.anneal.control(start = -1, end = -4, iter = 25000, update = 0)
#
# fit multiple models
 fit2 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21], type = 2,
               select = 2, ntrees = c(1,2), nleaves =c(1,7), anneal.control = myanneal2)
# equivalent
## Not run: 
##D fit2 <- logreg(select = 2, ntrees = c(1,2), nleaves =c(1,7), oldfit = fit1,
##D                 anneal.control = myanneal2)
## End(Not run)
 plot(fit2)
# use logreg.savefit2 for the results with 25000 iterations
 plot(logreg.savefit2)
 print(logreg.savefit2)
# After an initial steep decline, the scores only get slightly better
# for models with more than four leaves and two trees. 
#
# cross validation
 fit3 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21], type = 2,
                select = 3, ntrees = c(1,2), nleaves=c(1,7), anneal.control = myanneal2)
# equivalent
## Not run: fit3 <- logreg(select = 3, oldfit = fit2)
 plot(fit3)
# use logreg.savefit3 for the results with 25000 iterations
 plot(logreg.savefit3)
# 4 leaves, 2 trees should top
# null model test
 fit4 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21], type = 2,
                select = 4, ntrees = 2, anneal.control = myanneal2)
# equivalent
## Not run: fit4 <- logreg(select = 4, anneal.control = myanneal2, oldfit = fit1)
 plot(fit4)
# use logreg.savefit4 for the results with 25000 iterations
plot(logreg.savefit4)
# A histogram of the 25 scores obtained from the permutation test. Also shown
# are the scores for the best scoring model with one logic tree, and the null
# model (no tree). Since the permutation scores are not even close to the score
# of the best model with one tree (fit on the original data), there is overwhelming
# evidence against the null hypothesis that there was no signal in the data. 
 fit5 <- logreg(resp = logreg.testdat[,1], bin=logreg.testdat[, 2:21], type = 2,
            select = 5, ntrees = c(1,2), nleaves=c(1,7), anneal.control = myanneal2,
            nrep = 10, oldfit = fit2)
# equivalent
## Not run: fit5 <- logreg(select = 5, nrep = 10, oldfit = fit2)
 plot(fit5)
# use logreg.savefit5 for the results with 25000 iterations and 25 permutations
 plot(logreg.savefit5)
# The permutation scores improve until we condition on a model with two trees and
# four leaves, and then do not change very much anymore. This indicates that the
# best model has indeed four leaves.
#
# greedy selection
 fit6 <- logreg(select = 6, ntrees = 2, nleaves =c(1,12), oldfit = fit1)
 plot(fit6)
# use logreg.savefit6 for the results with 25000 iterations
 plot(logreg.savefit6)
#
# Monte Carlo Logic Regression
fit7 <- logreg(select = 7, oldfit = fit1, mc.control=
               logreg.mc.control(nburn=500, niter=2500, hyperpars=log(2)))
# we need many more iterations for reasonable results
## Not run: 
##D logreg.savefit7 <- logreg(select = 7, oldfit = fit1, mc.control=
##D                logreg.mc.control(nburn=1000, niter=100000, hyperpars=log(2)))
## End(Not run)
#
plot(fit7)
# use logreg.savefit7 for the results with 25000 iterations
plot(logreg.savefit7)




