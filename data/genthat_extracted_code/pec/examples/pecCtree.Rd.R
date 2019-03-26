library(pec)


### Name: pecCtree
### Title: S3-Wrapper for ctree.
### Aliases: pecCtree

### ** Examples

library(prodlim)
library(party)
library(survival)
set.seed(50)
d <- SimSurv(50)
nd <- data.frame(X1=c(0,1,0),X2=c(-1,0,1))
f <- pecCtree(Surv(time,status)~X1+X2,data=d)
predictSurvProb(f,newdata=nd,times=c(3,8))




