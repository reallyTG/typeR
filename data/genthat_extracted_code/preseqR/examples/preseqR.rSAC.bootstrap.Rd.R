library(preseqR)


### Name: preseqR.rSAC.bootstrap
### Title: Best practice for r-SAC
### Aliases: preseqR.rSAC.bootstrap
### Keywords: estimator, r-SAC, bootstrap, best practice

### ** Examples

## load library
# library(preseqR)

## import data
# data(FisherButterfly)

## construct estimator for SAC
# estimator1 <- preseqR.rSAC.bootstrap(FisherButterfly, r=1)
## The number of species represented at least once in a sample, 
## when the sample size is 10 or 20 times of the initial sample
# estimator1$f(c(10, 20))
## The standard error of the estiamtes
# estimator1$se(c(10, 20))
## The confidence interval of the estimates
# lb <- estimator1$lb(c(10, 20))
# ub <- estimator1$ub(c(10, 20))
# matrix(c(lb, ub), byrow=FALSE, ncol=2)

## construct estimator for r-SAC
# estimator2 <- preseqR.rSAC.bootstrap(FisherButterfly, r=2)
## The number of species represented at least twice in a sample, 
## when the sample size is 50 or 100 times of the initial sample
# estimator2$f(c(50, 100))
## The standard error of the estiamtes
# estimator2$se(c(50, 100))
## The confidence interval of the estimates
# lb <- estimator2$lb(c(50, 100))
# ub <- estimator2$ub(c(50, 100))
# matrix(c(lb, ub), byrow=FALSE, ncol=2)



