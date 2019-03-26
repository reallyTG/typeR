library(pec)


### Name: predictEventProb
### Title: Predicting event probabilities (cumulative incidences) in
###   competing risk models.
### Aliases: predictEventProb predictEventProb.CauseSpecificCox
###   predictEventProb.riskRegression predictEventProb.FGR
###   predictEventProb.prodlim predictEventProb.rfsrc
### Keywords: survival

### ** Examples


library(pec)
library(CoxBoost)
library(survival)
library(riskRegression)
library(prodlim)
train <- SimCompRisk(100)
test <- SimCompRisk(10)
cox.fit  <- CSC(Hist(time,cause)~X1+X2,data=train)
predictEventProb(cox.fit,newdata=test,times=seq(1:10),cause=1)
## cb.fit <- coxboost(Hist(time,cause)~X1+X2,cause=1,data=train,stepno=10)
## predictEventProb(cb.fit,newdata=test,times=seq(1:10),cause=1)

## with strata
cox.fit2  <- CSC(list(Hist(time,cause)~strata(X1)+X2,Hist(time,cause)~X1+X2),data=train)
predictEventProb(cox.fit2,newdata=test,times=seq(1:10),cause=1)




