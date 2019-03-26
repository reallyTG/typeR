library(riskRegression)


### Name: predictRisk
### Title: Extrating predicting risks from regression models
### Aliases: predictRisk predictRisk.CauseSpecificCox
###   predictRisk.riskRegression predictRisk.FGR predictRisk.prodlim
###   predictRisk.rfsrc predictRisk.aalen predictRisk.cox.aalen
###   predictRisk.coxph predictRisk.cph predictRisk.default
###   predictRisk.matrix predictRisk.pecCtree predictRisk.pecCforest
###   predictRisk.psm predictRisk.selectCox predictRisk.survfit
###   predictRisk.randomForest predictRisk.lrm predictRisk.glm
###   predictRisk.rpart
### Keywords: survival

### ** Examples

## binary outcome
library(rms)
set.seed(7)
x <- abs(rnorm(20))
d <- data.frame(y=rbinom(20,1,x/max(x)),x=x,z=rnorm(20))
nd <- data.frame(y=rbinom(8,1,x/max(x)),x=abs(rnorm(8)),z=rnorm(8))
fit <- lrm(y~x+z,d)
predictRisk(fit,newdata=nd)

## survival outcome
# generate survival data
library(prodlim)
set.seed(100)
d <- sampleData(100,outcome="survival")
d[,X1:=as.numeric(as.character(X1))]
d[,X2:=as.numeric(as.character(X2))]
# then fit a Cox model
library(rms)
cphmodel <- cph(Surv(time,event)~X1+X2,data=d,surv=TRUE,x=TRUE,y=TRUE)
# or via survival
library(survival)
coxphmodel <- coxph(Surv(time,event)~X1+X2,data=d,x=TRUE,y=TRUE)

# Extract predicted survival probabilities 
# at selected time-points:
ttt <- quantile(d$time)
# for selected predictor values:
ndat <- data.frame(X1=c(0.25,0.25,-0.05,0.05),X2=c(0,1,0,1))
# as follows
predictRisk(cphmodel,newdata=ndat,times=ttt)
predictRisk(coxphmodel,newdata=ndat,times=ttt)

# stratified cox model
sfit <- coxph(Surv(time,event)~strata(X1)+X2,data=d,x=TRUE,y=TRUE)
predictRisk(sfit,newdata=d[1:3,],times=c(1,3,5,10))

## simulate learning and validation data
learndat <- sampleData(100,outcome="survival")
valdat <- sampleData(100,outcome="survival")
## use the learning data to fit a Cox model
library(survival)
fitCox <- coxph(Surv(time,event)~X1+X2,data=learndat,x=TRUE,y=TRUE)
## suppose we want to predict the survival probabilities for all subjects
## in the validation data at the following time points:
## 0, 12, 24, 36, 48, 60
psurv <- predictRisk(fitCox,newdata=valdat,times=seq(0,60,12))
## This is a matrix with event probabilities (1-survival)
## one column for each of the 5 time points
## one row for each validation set individual

# Do the same for a randomSurvivalForest model
# library(randomForestSRC)
# rsfmodel <- rfsrc(Surv(time,event)~X1+X2,data=learndat)
# prsfsurv=predictRisk(rsfmodel,newdata=valdat,times=seq(0,60,12))
# plot(psurv,prsfsurv)

## Cox with ridge option
f1 <- coxph(Surv(time,event)~X1+X2,data=learndat,x=TRUE,y=TRUE)
f2 <- coxph(Surv(time,event)~ridge(X1)+ridge(X2),data=learndat,x=TRUE,y=TRUE)
## Not run: 
##D plot(predictRisk(f1,newdata=valdat,times=10),
##D      riskRegression:::predictRisk.coxph(f2,newdata=valdat,times=10),
##D      xlim=c(0,1),
##D      ylim=c(0,1),
##D      xlab="Unpenalized predicted survival chance at 10",
##D      ylab="Ridge predicted survival chance at 10")
## End(Not run)

## competing risks

library(survival)
library(riskRegression)
library(prodlim)
train <- SimCompRisk(100)
test <- SimCompRisk(10)
cox.fit  <- CSC(Hist(time,cause)~X1+X2,data=train)
predictRisk(cox.fit,newdata=test,times=seq(1:10),cause=1)

## with strata
cox.fit2  <- CSC(list(Hist(time,cause)~strata(X1)+X2,Hist(time,cause)~X1+X2),data=train)
predictRisk(cox.fit2,newdata=test,times=seq(1:10),cause=1)




