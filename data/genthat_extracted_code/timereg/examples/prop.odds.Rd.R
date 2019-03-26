library(timereg)


### Name: prop.odds
### Title: Fit Semiparametric Proportional 0dds Model
### Aliases: prop.odds
### Keywords: survival

### ** Examples


data(sTRACE)
# Fits Proportional odds model 
out<-prop.odds(Event(time,status==9)~age+diabetes+chf+vf+sex,
sTRACE,max.time=7,n.sim=100)
summary(out)

par(mfrow=c(2,3))
plot(out,sim.ci=2)
plot(out,score=1) 

pout <- predict(out,Z=c(70,0,0,0,0))
plot(pout)

### alternative estimator for large data sets 
form <- Surv(time,status==9)~age+diabetes+chf+vf+sex
pform <- timereg.formula(form)
out2<-cox.aalen(pform,data=sTRACE,max.time=7,
	propodds=1,n.sim=0,robust=0,detail=0,Nit=40)
summary(out2)




