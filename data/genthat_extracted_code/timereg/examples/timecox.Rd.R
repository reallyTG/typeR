library(timereg)


### Name: timecox
### Title: Fit Cox model with partly timevarying effects.
### Aliases: timecox
### Keywords: survival

### ** Examples


data(sTRACE)
# Fits time-varying Cox model 
out<-timecox(Surv(time/365,status==9)~age+sex+diabetes+chf+vf,
data=sTRACE,max.time=7,n.sim=100)

summary(out)
par(mfrow=c(2,3))
plot(out)
par(mfrow=c(2,3))
plot(out,score=TRUE)

# Fits semi-parametric time-varying Cox model
out<-timecox(Surv(time/365,status==9)~const(age)+const(sex)+
const(diabetes)+chf+vf,data=sTRACE,max.time=7,n.sim=100)

summary(out)
par(mfrow=c(2,3))
plot(out)




