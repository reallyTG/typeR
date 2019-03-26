library(someMTP)


### Name: lsd.test
### Title: Multivariate Left Spherically Distributed (LSD) linear scores
###   test.
### Aliases: lsd.test lsd
### Keywords: htest

### ** Examples

set.seed(1)
#Standard multivariate LSD test for one sample case
X=matrix(rnorm(50),5,10)+2
lsd.test(resp=X,alternative=~1)

#Standard multivariate LSD test for two sample case
X2=X+matrix(c(0,0,1,1,1),5,10)*10
lsd.test(resp=X2,null=~1,alternative=c(0,0,1,1,1))

#General multivariate LSD test for linear predictor with covariates
lsd.test(resp=X2,null=cbind(rep(1,5),c(0,0,1,1,1)),alternative=1:5)




