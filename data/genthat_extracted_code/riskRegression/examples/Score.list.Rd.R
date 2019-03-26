library(riskRegression)


### Name: Score.list
### Title: Score risk predictions
### Aliases: Score.list Score

### ** Examples

# binary outcome
library(lava)
set.seed(18)
learndat <- sampleData(48,outcome="binary")
testdat <- sampleData(40,outcome="binary")

## score logistic regression models
lr1 = glm(Y~X1+X2+X7+X9,data=learndat,family=binomial)
lr2 = glm(Y~X3+X5,data=learndat,family=binomial)
Score(list("LR(X1+X2+X7+X9)"=lr1,"LR(X3+X5)"=lr2),formula=Y~1,data=testdat)

## ROC curve and calibration plot 
xb=Score(list("LR(X1+X2+X7+X9)"=lr1,"LR(X3+X5+X6)"=lr2),formula=Y~1,
        data=testdat,plots=c("calibration","ROC"))
plotROC(xb)
plotCalibration(xb)

## compute AUC for a list of continuous markers
markers = as.list(testdat[,.(X6,X7,X8,X9,X10)])
Score(markers,formula=Y~1,data=testdat,metrics=c("auc"))

# cross-validation
## Not run: 
##D learndat=sampleData(400,outcome="binary")
##D lr1a = glm(Y~X6,data=learndat,family=binomial)
##D lr2a = glm(Y~X7+X8+X9,data=learndat,family=binomial)
##D ## bootstrap cross-validation
##D x1=Score(list("LR1"=lr1a,"LR2"=lr2a),formula=Y~1,data=learndat,split.method="bootcv",B=100)
##D x1
##D ## leave-one-out and leave-pair-out bootstrap
##D x2=Score(list("LR1"=lr1a,"LR2"=lr2a),formula=Y~1,data=learndat,
##D               split.method="loob",
##D               B=100,plots="calibration")
##D x2
## End(Not run)
# survival outcome

# Score Cox regression models
library(survival)
library(rms)
library(prodlim)
set.seed(18)
trainSurv <- sampleData(100,outcome="survival")
testSurv <- sampleData(40,outcome="survival")
cox1 = coxph(Surv(time,event)~X1+X2+X7+X9,data=trainSurv, y=TRUE, x = TRUE)
cox2 = coxph(Surv(time,event)~X3+X5+X6,data=trainSurv, y=TRUE, x = TRUE)
xs=Score(list("Cox(X1+X2+X7+X9)"=cox1,"Cox(X3+X5+X6)"=cox2),
      formula=Surv(time,event)~1,data=testSurv,conf.int=FALSE,times=c(5,8))
xs

# time-dependent AUC for list of markers
survmarkers = as.list(testSurv[,.(X6,X7,X8,X9,X10)])
Score(survmarkers,
      formula=Surv(time,event)~1,metrics="auc",data=testSurv,
      conf.int=TRUE,times=c(5,8))

# compare models on test data
Score(list("Cox(X1+X2+X7+X9)"=cox1,"Cox(X3+X5+X6)"=cox2),
      formula=Surv(time,event)~1,data=testSurv,conf.int=TRUE,times=c(5,8))

# crossvalidation models in traindata
## Not run: 
##D library(survival)
##D set.seed(18)
##D trainSurv <- sampleData(400,outcome="survival")
##D cox1 = coxph(Surv(time,event)~X1+X2+X7+X9,data=trainSurv, y=TRUE, x = TRUE)
##D cox2 = coxph(Surv(time,event)~X3+X5+X6,data=trainSurv, y=TRUE, x = TRUE)
##D x1 = Score(list("Cox(X1+X2+X7+X9)"=cox1,"Cox(X3+X5+X6)"=cox2),
##D       formula=Surv(time,event)~1,data=trainSurv,conf.int=TRUE,times=c(5,8),
##D       split.method="loob",B=100,plots="calibration")
##D 
##D x2= Score(list("Cox(X1+X2+X7+X9)"=cox1,"Cox(X3+X5+X6)"=cox2),
##D       formula=Surv(time,event)~1,data=trainSurv,conf.int=TRUE,times=c(5,8),
##D       split.method="bootcv",B=100)
## End(Not run)

# restrict number of comparisons
## Not run: 
##D Score(list("Cox(X1+X2+X7+X9)"=cox1,"Cox(X3+X5+X6)"=cox2),
##D       formula=Surv(time,event)~1,data=trainSurv,contrasts=TRUE,
##D null.model=FALSE,conf.int=TRUE,times=c(5,8),split.method="bootcv",B=3)
## End(Not run)
# competing risks outcome
set.seed(18)
trainCR <- sampleData(40,outcome="competing.risks")
testCR <- sampleData(40,outcome="competing.risks")
library(riskRegression)
library(cmprsk)
# Cause-specific Cox regression
csc1 = CSC(Hist(time,event)~X1+X2+X7+X9,data=trainCR)
csc2 = CSC(Hist(time,event)~X3+X5+X6,data=trainCR)
# Fine-Gray regression
fgr1 = FGR(Hist(time,event)~X1+X2+X7+X9,data=trainCR,cause=1)
fgr2 = FGR(Hist(time,event)~X3+X5+X6,data=trainCR,cause=1)
Score(list("CSC(X1+X2+X7+X9)"=csc1,"CSC(X3+X5+X6)"=csc2,
           "FGR(X1+X2+X7+X9)"=fgr1,"FGR(X3+X5+X6)"=fgr2),
      formula=Hist(time,event)~1,data=testCR,se.fit=1L,times=c(5,8))

## Not run: 
##D # reproduce some results of Table IV of Blanche et al. Stat Med 2013
##D data(Paquid)
##D ResPaquid <- Score(list("DSST"=-Paquid$DSST,"MMSE"=-Paquid$MMSE),
##D                    formula=Hist(time,status)~1,
##D                    data=Paquid,
##D                    null.model = FALSE,
##D                    conf.int=TRUE,
##D                    metrics=c("auc"),
##D                    times=c(3,5,10),
##D                    plots="ROC")
##D ResPaquid
##D plotROC(ResPaquid,time=5)
## End(Not run)



