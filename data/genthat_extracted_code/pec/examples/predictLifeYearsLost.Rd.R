library(pec)


### Name: predictLifeYearsLost
### Title: Predicting life years lost (cumulative cumulative incidences) in
###   competing risk models.
### Aliases: predictLifeYearsLost predictLifeYearsLost.CauseSpecificCox
###   predictLifeYearsLost.riskRegression predictLifeYearsLost.FGR
###   predictLifeYearsLost.prodlim predictLifeYearsLost.rfsrc
### Keywords: survival

### ** Examples


library(pec)
library(riskRegression)
library(survival)
library(prodlim)
train <- SimCompRisk(100)
test <- SimCompRisk(10)
fit <- CSC(Hist(time,cause)~X1+X2,data=train,cause=1)
predictLifeYearsLost(fit,newdata=test,times=seq(1:10),cv=FALSE,cause=1)




