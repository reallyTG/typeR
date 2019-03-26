library(riskRegression)


### Name: boxplot.Score
### Title: Boxplot risk quantiles
### Aliases: boxplot.Score

### ** Examples

# binary outcome
db=sampleData(40,outcome="binary")
fitconv=glm(Y~X3+X5,data=db,family=binomial)
fitnew=glm(Y~X1+X3+X5+X6+X7,data=db,family=binomial)
scoreobj=Score(list(new=fitnew,conv=fitconv),
        formula=Y~1,contrasts=list(c(2,1)),
               data=db,summary="riskQuantile",null.model=FALSE)
boxplot(scoreobj)

# survival outcome
library(survival)
ds=sampleData(40,outcome="survival")
fitconv=coxph(Surv(time,event)~X6,data=ds,x=TRUE,y=TRUE)
fitnew=coxph(Surv(time,event)~X6+X9,data=ds,x=TRUE,y=TRUE)
## Not run: 
##D  
##D scoreobj=Score(list("conventional model"=fitconv,"new model"=fitnew),
##D                 formula=Hist(time,event)~1, data=ds,
##D                 summary="riskQuantile",metrics=NULL, plots=NULL,
##D                 c(0,0.25,0.5,0.75,1),
##D                 times=5,null.model=FALSE)
##D boxplot(scoreobj)
##D 
##D scoreobj1=Score(list("conventional model"=fitconv,"new model"=fitnew),
##D                 formula=Hist(time,event)~1, data=ds,
##D                 summary="riskQuantile",metrics=NULL, plots=NULL,
##D                 times=5,null.model=FALSE,compare=list(c(2,1)))
##D boxplot(scoreobj1)
## End(Not run)

# competing risks outcome
library(survival)
data(Melanoma, package = "riskRegression")
fitconv = CSC(Hist(time,status)~invasion+age+sex,data=Melanoma)
fitnew = CSC(Hist(time,status)~invasion+age+sex+logthick,data=Melanoma)
scoreobj=Score(list("Conventional model"=fitconv,"New model"=fitnew),
               formula=Hist(time,status)~1,
               data=Melanoma,metrics=NULL,summary="riskQuantile",times=5*365.25,null.model=FALSE)
boxplot(scoreobj)

# more than 2 competing risks
m=lava::lvm(~X1+X2+X3)
lava::distribution(m, "eventtime1") <- lava::coxWeibull.lvm(scale = 1/100)
lava::distribution(m, "eventtime2") <- lava::coxWeibull.lvm(scale = 1/100)
lava::distribution(m, "eventtime3") <- lava::coxWeibull.lvm(scale = 1/100)
lava::distribution(m, "censtime") <- lava::coxWeibull.lvm(scale = 1/100)
lava::regression(m,eventtime2~X3)=1.3
m <- lava::eventTime(m,
time ~ min(eventtime1 = 1, eventtime2 = 2, eventtime3 = 3, censtime = 0), "event")
set.seed(101)
dcr=as.data.table(lava::sim(m,101))
fitOld = CSC(Hist(time,event)~X1+X2,data=dcr)
fitNew = CSC(Hist(time,event)~X1+X2+X3,data=dcr)
scoreobj=Score(list("Conventional model"=fitOld,"New model"=fitNew),
               formula=Hist(time,event)~1,
               data=dcr,summary="riskQuantile",times=5,null.model=FALSE)
boxplot(scoreobj)





