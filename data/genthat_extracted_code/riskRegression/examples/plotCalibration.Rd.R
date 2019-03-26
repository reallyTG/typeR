library(riskRegression)


### Name: plotCalibration
### Title: Plot Calibration curve
### Aliases: plotCalibration

### ** Examples

# binary 
db=sampleData(100,outcome="binary")
fb1=glm(Y~X1+X5+X7,data=db,family="binomial")
fb2=glm(Y~X1+X3+X6+X7,data=db,family="binomial")
xb=Score(list(model1=fb1,model2=fb2),Y~1,data=db,
          plots="cal")
plotCalibration(xb)
plotCalibration(xb,models=1,bars=TRUE,names.cex=1.3)

# survival
library(survival)
ds=sampleData(100,outcome="survival")
fs1=coxph(Surv(time,event)~X1+X5+X7,data=ds,x=1)
fs2=coxph(Surv(time,event)~X1+X3+X6+X7,data=ds,x=1)
xs=Score(list(Cox1=fs1,Cox2=fs2),Surv(time,event)~1,data=ds,
          plots="cal",metrics=NULL)
plotCalibration(xs)


# competing risks
data(Melanoma)
f1 <- CSC(Hist(time,status)~age+sex+epicel+ulcer,data=Melanoma)
f2 <- CSC(Hist(time,status)~age+sex+logthick+epicel+ulcer,data=Melanoma)
x <- Score(list(model1=f1,model2=f2),Hist(time,status)~1,data=Melanoma,
           cause= 2,times=5*365.25,plots="cal")
plotCalibration(x)



