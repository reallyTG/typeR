library(mets)


### Name: dspline
### Title: Simple linear spline
### Aliases: dspline dspline<-

### ** Examples

data(TRACE)
TRACE <- dspline(TRACE,~wmi,breaks=c(1,1.3,1.7))
cca <- coxph(Surv(time,status==9)~age+vf+chf+wmi,data=TRACE)
cca2 <- coxph(Surv(time,status==9)~age+wmi+vf+chf+wmi.spline1+wmi.spline2+wmi.spline3,data=TRACE)
anova(cca,cca2)

nd=data.frame(age=50,vf=0,chf=0,wmi=seq(0.4,3,by=0.01))
nd <- dspline(nd,~wmi,breaks=c(1,1.3,1.7))
pl <- predict(cca2,newdata=nd)
plot(nd$wmi,pl,type="l")




