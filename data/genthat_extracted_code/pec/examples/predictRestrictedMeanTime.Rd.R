library(pec)


### Name: predictRestrictedMeanTime
### Title: Predicting restricted mean time
### Aliases: predictRestrictedMeanTime predictRestrictedMeanTime.aalen
###   predictRestrictedMeanTime.riskRegression
###   predictRestrictedMeanTime.cox.aalen predictRestrictedMeanTime.coxph
###   predictRestrictedMeanTime.cph predictRestrictedMeanTime.default
###   predictRestrictedMeanTime.rfsrc predictRestrictedMeanTime.matrix
###   predictRestrictedMeanTime.pecCtree predictRestrictedMeanTime.prodlim
###   predictRestrictedMeanTime.psm predictRestrictedMeanTime.selectCox
###   predictRestrictedMeanTime.survfit predictRestrictedMeanTime.pecRpart
### Keywords: survival

### ** Examples


# generate some survival data
library(prodlim)
set.seed(100)
d <- SimSurv(100)
# then fit a Cox model
library(rms)
coxmodel <- cph(Surv(time,status)~X1+X2,data=d,surv=TRUE)

# predicted survival probabilities can be extracted
# at selected time-points:
ttt <- quantile(d$time)
# for selected predictor values:
ndat <- data.frame(X1=c(0.25,0.25,-0.05,0.05),X2=c(0,1,0,1))
# as follows
predictRestrictedMeanTime(coxmodel,newdata=ndat,times=ttt)

# stratified cox model
sfit <- coxph(Surv(time,status)~strata(X1)+X2,data=d,x=TRUE,y=TRUE)
predictRestrictedMeanTime(sfit,newdata=d[1:3,],times=c(1,3,5,10))

## simulate some learning and some validation data
learndat <- SimSurv(100)
valdat <- SimSurv(100)
## use the learning data to fit a Cox model
library(survival)
fitCox <- coxph(Surv(time,status)~X1+X2,data=learndat,x=TRUE,y=TRUE)
## suppose we want to predict the survival probabilities for all patients
## in the validation data at the following time points:
## 0, 12, 24, 36, 48, 60
psurv <- predictRestrictedMeanTime(fitCox,newdata=valdat,times=seq(0,60,12))
## This is a matrix with survival probabilities
## one column for each of the 5 time points
## one row for each validation set individual

# the same can be done e.g. for a randomSurvivalForest model
library(randomForestSRC)
rsfmodel <- rfsrc(Surv(time,status)~X1+X2,data=d)
predictRestrictedMeanTime(rsfmodel,newdata=ndat,times=ttt)



