library(pec)


### Name: pec
### Title: Prediction error curves
### Aliases: pec
### Keywords: survival

### ** Examples


# simulate an artificial data frame
# with survival response and two predictors

set.seed(130971)
library(prodlim)
library(survival)
dat <- SimSurv(100)

# fit some candidate Cox models and compute the Kaplan-Meier estimate 

Models <- list("Cox.X1"=coxph(Surv(time,status)~X1,data=dat,x=TRUE,y=TRUE),
              "Cox.X2"=coxph(Surv(time,status)~X2,data=dat,x=TRUE,y=TRUE),
              "Cox.X1.X2"=coxph(Surv(time,status)~X1+X2,data=dat,x=TRUE,y=TRUE))

# compute the apparent prediction error 
PredError <- pec(object=Models,
                  formula=Surv(time,status)~X1+X2,
                  data=dat,
                  exact=TRUE,
                  cens.model="marginal",
                  splitMethod="none",
                  B=0,
                  verbose=TRUE)

print(PredError,times=seq(5,30,5))
summary(PredError)
plot(PredError,xlim=c(0,30))

# Comparison of Weibull model and Cox model
library(survival)
library(rms)
library(pec)
data(pbc)
pbc <- pbc[sample(1:NROW(pbc),size=100),]
f1 <- psm(Surv(time,status!=0)~edema+log(bili)+age+sex+albumin,data=pbc)
f2 <- coxph(Surv(time,status!=0)~edema+log(bili)+age+sex+albumin,data=pbc,x=TRUE,y=TRUE)
f3 <- cph(Surv(time,status!=0)~edema+log(bili)+age+sex+albumin,data=pbc,surv=TRUE)
brier <- pec(list("Weibull"=f1,"CoxPH"=f2,"CPH"=f3),data=pbc,formula=Surv(time,status!=0)~1)
print(brier)
plot(brier)

# compute the .632+ estimate of the generalization error
set.seed(130971)
library(prodlim)
library(survival)
dat <- SimSurv(100)
set.seed(17100)
PredError.632plus <- pec(object=Models,
                  formula=Surv(time,status)~X1+X2,
                  data=dat,
                  exact=TRUE,
                  cens.model="marginal",
                  splitMethod="Boot632plus",
                  B=3,
                  verbose=TRUE)

print(PredError.632plus,times=seq(4,12,4))
summary(PredError.632plus)
plot(PredError.632plus,xlim=c(0,30))
# do the same again but now in parallel
## Not run: 
##D set.seed(17100)
##D # library(doMC)
##D # registerDoMC()
##D PredError.632plus <- pec(object=Models,
##D                   formula=Surv(time,status)~X1+X2,
##D                   data=dat,
##D                   exact=TRUE,
##D                   cens.model="marginal",
##D                   splitMethod="Boot632plus",
##D                   B=3,
##D                   verbose=TRUE)
## End(Not run)
# assessing parametric survival models in learn/validation setting
learndat <- SimSurv(50)
testdat <- SimSurv(30)
library(rms)
f1 <- psm(Surv(time,status)~X1+X2,data=learndat)
f2 <- psm(Surv(time,status)~X1,data=learndat)
pf <- pec(list(f1,f2),formula=Surv(time,status)~1,data=testdat,maxtime=200)
plot(pf)
summary(pf)

# ---------------- competing risks -----------------

library(survival)
library(riskRegression)
library(cmprsk)
library(pec)
cdat <- SimCompRisk(100)
f1  <- CSC(Hist(time,event)~X1+X2,cause=2,data=cdat)
f2  <- CSC(Hist(time,event)~X1,data=cdat,cause=2)
require(cmprsk)
## predict.crr <- cmprsk:::predict.crr
f3  <- FGR(Hist(time,event)~X1+X2,cause=2,data=cdat)
f4  <- FGR(Hist(time,event)~X1+X2,cause=2,data=cdat)
p1 <- pec(list(f1,f2,f3,f4),formula=Hist(time,event)~1,data=cdat,cause=2)




