library(pec)


### Name: cindex
### Title: Concordance index for right censored survival time data
### Aliases: cindex
### Keywords: survival

### ** Examples


 # simulate data based on Weibull regression  
library(prodlim)
 set.seed(13)
 dat <- SimSurv(100)
 # fit three different Cox models and a random survival forest
 # note: low number of trees for the purpose of illustration 
 library(survival)
 library(randomForestSRC)
 cox12 <- coxph(Surv(time,status)~X1+X2,data=dat,x=TRUE,y=TRUE)
 cox1 <- coxph(Surv(time,status)~X1,data=dat,x=TRUE,y=TRUE)
 cox2 <- coxph(Surv(time,status)~X2,data=dat,x=TRUE,y=TRUE)
 rsf1 <- rfsrc(Surv(time,status)~X1+X2,data=dat,ntree=15,forest=TRUE)
 #
 # compute the apparent estimate of the C-index at different time points
 #
ApparrentCindex  <- pec::cindex(list("Cox X1"=cox1,
		       "Cox X2"=cox2,
		       "Cox X1+X2"=cox12,
                       "RSF"=rsf1),
		  formula=Surv(time,status)~X1+X2,
		  data=dat,
		  eval.times=seq(1,15,1))
  print(ApparrentCindex)
  plot(ApparrentCindex)
 #
 # compute the bootstrap-crossvalidation estimate of
 # the C-index at different time points
 #
set.seed(142)
bcvCindex  <- pec::cindex(list("Cox X1"=cox1,
		       "Cox X2"=cox2,
		       "Cox X1+X2"=cox12,
                       "RSF"=rsf1),
		  formula=Surv(time,status)~X1+X2,
		  data=dat,
                  splitMethod="bootcv",
                  B=5,
 		  eval.times=seq(1,15,1))
  print(bcvCindex)
  plot(bcvCindex)
 # for uncensored data the results are the same
 # as those obtained with the function rcorr.cens from Hmisc
library(Hmisc)
set.seed(16)
dat <- SimSurv(30)
dat$staus=1
fit12 <- coxph(Surv(time,status)~X1+X2,data=dat,x=TRUE,y=TRUE)
fit1 <- coxph(Surv(time,status)~X1,data=dat,x=TRUE,y=TRUE)
fit2 <- coxph(Surv(time,status)~X2,data=dat,x=TRUE,y=TRUE)
Cpec <- pec::cindex(list("Cox X1+X2"=fit12,"Cox X1"=fit1,"Cox X2"=fit2),
	       formula=Surv(time,status)~1,
	       data=dat,
	       eval.times=Inf)
p1 <- predictSurvProb(fit1,newdata=dat,times=10)
p2 <- predictSurvProb(fit2,newdata=dat,times=10)
p12 <- predictSurvProb(fit12,newdata=dat,times=10)
harrelC1 <- rcorr.cens(p1,with(dat,Surv(time,status)))
harrelC2 <- rcorr.cens(p2,with(dat,Surv(time,status)))
harrelC12 <- rcorr.cens(p12,with(dat,Surv(time,status)))
harrelC1[["C Index"]]==Cpec$AppCindex[["Cox.X1"]]
harrelC2[["C Index"]]==Cpec$AppCindex[["Cox.X2"]]
harrelC12[["C Index"]]==Cpec$AppCindex[["Cox.X1.X2"]]
 #
 # competing risks 
 #
library(riskRegression)
library(prodlim)
set.seed(30)
dcr.learn <- SimCompRisk(30)
dcr.val <- SimCompRisk(30)
pec::cindex(CSC(Hist(time,event)~X1+X2,data=dcr.learn),data=dcr.val)




