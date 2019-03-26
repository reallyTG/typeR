library(preseqR)


### Name: ds.rSAC.bootstrap
### Title: RFA estimator with bootstrap
### Aliases: ds.rSAC.bootstrap
### Keywords: estimator, r-SAC, RFA, bootstrap, nonparametric

### ** Examples

## load library
# library(preseqR)

## import data
# data(FisherButterfly)

## construct the estimator for SAC
# ds1 <- ds.rSAC.bootstrap(FisherButterfly, r=1)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
# ds1$f(c(10, 20))
## The standard error of the estiamtes
# ds1$se(c(10, 20))
## The confidence interval of the estimates
# lb <- ds1$lb(c(10, 20))
# ub <- ds1$ub(c(10, 20))
# matrix(c(lb, ub), byrow=FALSE, ncol=2)

## construct the estimator for SAC
# ds2 <- ds.rSAC.bootstrap(FisherButterfly, r=2)
## The number of species represented at least twice in a sample, 
## when the sample size is 50 or 100 times of the initial sample
# ds2$f(c(50, 100))
## The standard error of the estiamtes
# ds2$se(c(50, 100))
## The confidence interval of the estimates
# lb <- ds2$lb(c(50, 100))
# ub <- ds2$ub(c(50, 100))
# matrix(c(lb, ub), byrow=FALSE, ncol=2)



