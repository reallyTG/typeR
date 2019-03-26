library(pec)


### Name: pecRpart
### Title: Predict survival based on rpart tree object
### Aliases: pecRpart

### ** Examples

library(prodlim)
library(rpart)
library(survival)
set.seed(50)
d <- SimSurv(50)
nd <- data.frame(X1=c(0,1,0),X2=c(-1,0,1))
f <- pecRpart(Surv(time,status)~X1+X2,data=d)
predictSurvProb(f,newdata=nd,times=c(3,8))



