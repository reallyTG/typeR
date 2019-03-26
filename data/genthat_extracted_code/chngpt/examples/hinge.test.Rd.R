library(chngpt)


### Name: hinge.test
### Title: A non-nested hypothesis testing problem for threshold regression
###   models
### Aliases: hinge.test

### ** Examples


dat=sim.hinge(threshold.type = 'NA',family = 'binomial',thres='NA',X.ditr = 'norm',mu.X = c(0,0,0),
    coef.X = c(0,.5,.5,.4),cov.X = diag(3),eps.sd = 1,seed = 1,n=100)
test=hinge.test(Y~X1+X2, "x", family="binomial", data=dat,'method'='FDB',boot.B=10)
test




