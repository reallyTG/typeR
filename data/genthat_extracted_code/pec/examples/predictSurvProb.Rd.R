library(pec)


### Name: predictSurvProb
### Title: Predicting survival probabilities
### Aliases: predictSurvProb predictSurvProb.aalen
###   predictSurvProb.riskRegression predictSurvProb.cox.aalen
###   predictSurvProb.coxph predictSurvProb.cph predictSurvProb.default
###   predictSurvProb.rfsrc predictSurvProb.matrix predictSurvProb.pecCtree
###   predictSurvProb.pecCforest predictSurvProb.prodlim
###   predictSurvProb.psm predictSurvProb.selectCox predictSurvProb.survfit
###   predictSurvProb.pecRpart
### Keywords: survival

### ** Examples


# generate some survival data
library(prodlim)
set.seed(100)
d <- SimSurv(100)
# then fit a Cox model
library(rms)
coxmodel <- cph(Surv(time,status)~X1+X2,data=d,surv=TRUE)

# Extract predicted survival probabilities 
# at selected time-points:
ttt <- quantile(d$time)
# for selected predictor values:
ndat <- data.frame(X1=c(0.25,0.25,-0.05,0.05),X2=c(0,1,0,1))
# as follows
predictSurvProb(coxmodel,newdata=ndat,times=ttt)

# stratified cox model
sfit <- coxph(Surv(time,status)~strata(X1)+X2,data=d,,x=TRUE,y=TRUE)
predictSurvProb(sfit,newdata=d[1:3,],times=c(1,3,5,10))

## simulate some learning and some validation data
learndat <- SimSurv(100)
valdat <- SimSurv(100)
## use the learning data to fit a Cox model
library(survival)
fitCox <- coxph(Surv(time,status)~X1+X2,data=learndat,x=TRUE,y=TRUE)
## suppose we want to predict the survival probabilities for all patients
## in the validation data at the following time points:
## 0, 12, 24, 36, 48, 60
psurv <- predictSurvProb(fitCox,newdata=valdat,times=seq(0,60,12))
## This is a matrix with survival probabilities
## one column for each of the 5 time points
## one row for each validation set individual

# Do the same for a randomSurvivalForest model
library(randomForestSRC)
rsfmodel <- rfsrc(Surv(time,status)~X1+X2,data=d)
predictSurvProb(rsfmodel,newdata=ndat,times=ttt)

## Cox with ridge option
f1 <- coxph(Surv(time,status)~X1+X2,data=learndat,x=TRUE,y=TRUE)
f2 <- coxph(Surv(time,status)~ridge(X1)+ridge(X2),data=learndat,x=TRUE,y=TRUE)
plot(predictSurvProb(f1,newdata=valdat,times=10),
     pec:::predictSurvProb.coxph(f2,newdata=valdat,times=10),
     xlim=c(0,1),
     ylim=c(0,1),
     xlab="Unpenalized predicted survival chance at 10",
     ylab="Ridge predicted survival chance at 10")





