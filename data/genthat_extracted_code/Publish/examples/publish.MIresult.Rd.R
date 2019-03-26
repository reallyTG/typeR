library(Publish)


### Name: publish.MIresult
### Title: Present logistic regression and Cox regression obtained with
###   mitools::MIcombine based on smcfcs::smcfcs multiple imputation
###   analysis
### Aliases: publish.MIresult

### ** Examples


## Not run: 
##D ## continuous outcome: linear regression
##D # lava some data with missing values
##D library(riskRegression)
##D set.seed(7)
##D d=sampleData(78)
##D ## generate missing values
##D d[X1==1,X6:=NA] 
##D d[X2==1,X3:=NA]
##D d=d[,.(X8,X4,X3,X6,X7)]
##D sapply(d,function(x)sum(is.na(x)))
##D 
##D # multiple imputation (should set m to a large value)
##D 
##D library(smcfcs)
##D library(mitools)
##D set.seed(17)
##D f= smcfcs(d,smtype="lm",
##D            smformula=X8~X4+X3+X6+X7,
##D            method=c("","","logreg","norm",""),m=3)
##D ccfit=lm(X8~X4+X3+X6+X7,data=d)
##D mifit=MIcombine(with(imputationList(f$impDatasets),
##D                 lm(X8~X4+X3+X6+X7)))
##D publish(mifit,fit=ccfit,data=d)
##D publish(ccfit)
##D 
##D ## binary outcome
##D # lava some data with missing values
##D library(riskRegression)
##D set.seed(7)
##D db=sampleData(78,outcome="binary")
##D ## generate missing values
##D db[X1==1,X6:=NA] 
##D db[X2==1,X3:=NA]
##D db=db[,.(Y,X4,X3,X6,X7)]
##D sapply(db,function(x)sum(is.na(x)))
##D 
##D # multiple imputation (should set m to a large value)
##D library(smcfcs)
##D library(mitools)
##D set.seed(17)
##D fb= smcfcs(db,smtype="logistic",
##D            smformula=Y~X4+X3+X6+X7,
##D            method=c("","","logreg","norm",""),m=2)
##D ccfit=glm(Y~X4+X3+X6+X7,family="binomial",data=db)
##D mifit=MIcombine(with(imputationList(fb$impDatasets),
##D                 glm(Y~X4+X3+X6+X7,family="binomial")))
##D publish(mifit,fit=ccfit)
##D publish(ccfit)
##D 
##D ## survival: Cox regression
##D library(smcfcs)
##D library(mitools)
##D library(survival)
##D # lava some data with missing values
##D library(riskRegression)
##D set.seed(7)
##D ds=sampleData(78,outcome="survival")
##D ## generate missing values
##D ds[X5==1,X6:=NA] 
##D ds[X2==1,X3:=NA]
##D ds=ds[,.(time,event,X4,X3,X6,X7)]
##D sapply(ds,function(x)sum(is.na(x)))
##D 
##D set.seed(17)
##D fs= smcfcs(ds,smtype="coxph",
##D            smformula="Surv(time,event)~X4+X3+X6+X7",
##D            method=c("","","","logreg","norm",""),m=2)
##D ccfit=coxph(Surv(time,event)~X4+X3+X6+X7,data=ds)
##D mifit=MIcombine(with(imputationList(fs$impDatasets),
##D                 coxph(Surv(time,event)~X4+X3+X6+X7)))
##D publish(mifit,fit=ccfit,data=ds)
##D publish(ccfit)
##D 
##D ## competing risks: Cause-specific Cox regression 
##D library(survival)
##D library(smcfcs)
##D library(mitools)
##D # lava some data with missing values
##D library(riskRegression)
##D set.seed(7)
##D dcr=sampleData(78,outcome="competing.risks")
##D ## generate missing values
##D dcr[X5==1,X6:=NA] 
##D dcr[X2==1,X3:=NA]
##D dcr=dcr[,.(time,event,X4,X3,X6,X7)]
##D sapply(dcr,function(x)sum(is.na(x)))
##D 
##D set.seed(17)
##D fcr= smcfcs(dcr,smtype="compet",
##D            smformula=c("Surv(time,event==1)~X4+X3+X6+X7",
##D                        "Surv(time,event==2)~X4+X3+X6+X7"),
##D            method=c("","","","logreg","norm",""),m=2)
##D ## cause 2 
##D ccfit2=coxph(Surv(time,event==2)~X4+X3+X6+X7,data=dcr)
##D mifit2=MIcombine(with(imputationList(fcr$impDatasets),
##D                 coxph(Surv(time,event==2)~X4+X3+X6+X7)))
##D publish(mifit2,fit=ccfit2,data=dcr)
##D publish(ccfit2)
## End(Not run) 




