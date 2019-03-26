library(preseqR)


### Name: preseqR.sample.cov.bootstrap
### Title: Predicting generalized sample coverage with bootstrap
### Aliases: preseqR.sample.cov.bootstrap
### Keywords: estimator, RFA, bootstrap, sample coverage

### ** Examples

## load library
#library(preseqR)

## import data
#data(FisherButterfly)

## construct the estimator for the sample coverage
# estimator1 <- preseqR.sample.cov.bootstrap(FisherButterfly, r=1)
## Given a sample that is 10 times or 20 times the size of an initial samples,
## suppose one randomly draws one more individual from the population. The
## value of the function is the probability that the representing species 
## has been observed in the sample
# estimator1$f(c(10, 20))
## The standard error of the estiamtes
# estimator1$se(c(10, 20))
## The confidence interval of the estimates
# lb <- estimator1$lb(c(10, 20))
# ub <- estimator1$ub(c(10, 20))
# matrix(c(lb, ub), byrow=FALSE, ncol=2)

## construct the estimator
# estimator2 <- preseqR.rSAC.bootstrap(FisherButterfly, r=2)
## the probability when the sample size is 50 times or 100 times of the initial
## sample
# estimator2$f(c(50, 100))
## The standard error of the estiamtes
# estimator2$se(c(50, 100))
## The confidence interval of the estimates
# lb <- estimator2$lb(c(50, 100))
# ub <- estimator2$ub(c(50, 100))
# matrix(c(lb, ub), byrow=FALSE, ncol=2)



