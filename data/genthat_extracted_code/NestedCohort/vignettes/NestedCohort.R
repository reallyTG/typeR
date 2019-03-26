### R code from vignette source 'NestedCohort.Rnw'

###################################################
### code chunk number 1: NestedCohort.Rnw:45-47
###################################################
# In a verbatim environment, more than 98 will go over the edge
options(width=90,digits=4)


###################################################
### code chunk number 2: setup
###################################################
library(NestedCohort)
data(zinc)


###################################################
### code chunk number 3: SeeVariables
###################################################
str(zinc)


###################################################
### code chunk number 4: KaplanMeier
###################################################
mod <- nested.km(survfitformula="Surv(futime01,ec01==1)~znquartiles",
                       samplingmod="ec01*basehist",exposureofinterest="Q4",data=zinc)


###################################################
### code chunk number 5: SummaryKaplanMeier
###################################################
summary(mod)


###################################################
### code chunk number 6: PlotKM
###################################################
plot(mod,ymin=.6,xlab="Time (Days)",ylab="Survival",main="Survival by Quartile of Zinc",lty=1:4)
legend(2000,0.7,c("Q1","Q2","Q3","Q4"),lty=1:4)


###################################################
### code chunk number 7: HazardRatios
###################################################
coxmod <- nested.coxph(coxformula="Surv(futime01,ec01==1)~sex+agepill+basehist+anyhist+zncent",samplingmod="ec01*basehist",data=zinc)
summary(coxmod) 


###################################################
### code chunk number 8: StdSurv
###################################################
mod<-nested.stdsurv(outcome="Surv(futime01,ec01==1)",exposures="znquartiles",
                      confounders="sex+agestr+basehist+anyhist",
                      samplingmod="ec01*basehist",exposureofinterest="Q4",data=zinc)


###################################################
### code chunk number 9: PlotStdSurv
###################################################
mod<-nested.stdsurv(outcome="Surv(futime01,ec01==1)",exposures="znquartiles",
                      confounders="sex+agestr+basehist+anyhist",
                      samplingmod="ec01*basehist",exposureofinterest="Q4",plot=T,
                        main="Time to Esophageal Cancer by Quartiles of Zinc",data=zinc)


###################################################
### code chunk number 10: JointHazardRatios
###################################################
coxmod <- nested.coxph("Surv(futime01,ec01==1)~sex+agepill+basehist+anyhist+zncent+cacent",samplingmod="ec01*basehist",data=zinc)
summary(coxmod) 


###################################################
### code chunk number 11: JointStdSurv
###################################################
zinc$caquartiles <- cut(zinc$cacent,breaks=quantile(zinc$cacent,seq(0,1,1/4),na.rm=T),include.lowest=T,labels=paste("Q",1:4,sep=""))
mod <- nested.stdsurv(outcome="Surv(futime01,ec01==1)",exposures="znquartiles+caquartiles",
                      confounders="sex+agestr+basehist+anyhist",
                      samplingmod="ec01*basehist",exposureofinterest="Q4,Q4",data=zinc)


