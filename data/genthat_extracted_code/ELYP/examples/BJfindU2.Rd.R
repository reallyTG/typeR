library(ELYP)


### Name: BJfindU2
### Title: Find the Wilks Confidence Interval Upper Bound for Betafun from
###   the 2 dimensional Buckley-James Empirical Likelihood Ratio Function
### Aliases: BJfindU2
### Keywords: nonparametric htest

### ** Examples
 
# The Stanford Heart Transplant Data: with 152 cases.
# Needs bjtest( ) function from emplik package to run.

## BJloglik <- function(para, dataMat) {
##            yvec <- dataMat[,1]
##            dvec <- dataMat[,2]
##            x <- dataMat[,3:4]
## temp <- bjtest(y=log10(yvec), d=dvec, x=x, beta=para)
## return(temp)
## }

## BJ2fun <- function (b1, b2) {
##    return(b2)
## }

## We first use bj() from Design library to find NPmle and
## the conservative SD of beta1 and beta2

## BJfindU2(NPmle=c(3.52696077,-0.01989555), 
##      ConfInt=c(0.3,0.0066), LLRfn=BJloglik, 
##      Betafun=BJ2fun, 
##      dataMat=cbind(stanford5$time, stanford5$status, 
##      rep(1,152),stanford5$age))
##
# This will take (~ 1 min.) to run.



