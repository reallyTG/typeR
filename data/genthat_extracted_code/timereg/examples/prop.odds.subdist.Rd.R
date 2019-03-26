library(timereg)


### Name: prop.odds.subdist
### Title: Fit Semiparametric Proportional 0dds Model for the competing
###   risks subdistribution
### Aliases: prop.odds.subdist
### Keywords: survival

### ** Examples


library(timereg)
data(bmt)
# Fits Proportional odds model 
out <- prop.odds.subdist(Event(time,cause)~platelet+age+tcell,data=bmt,
 cause=1,cens.model="KM",detail=0,n.sim=1000)
summary(out) 
par(mfrow=c(2,3))
plot(out,sim.ci=2); 
plot(out,score=1) 

# simple predict function without confidence calculations 
pout <- predictpropodds(out,X=model.matrix(~platelet+age+tcell,data=bmt)[,-1])
matplot(pout$time,pout$pred,type="l")

# predict function with confidence intervals
pout2 <- predict(out,Z=c(1,0,1))
plot(pout2,col=2)
pout1 <- predictpropodds(out,X=c(1,0,1))
lines(pout1$time,pout1$pred,type="l")

# Fits Proportional odds model with stratified baseline, does not work yet!
###out <- Gprop.odds.subdist(Surv(time,cause==1)~-1+factor(platelet)+
###prop(age)+prop(tcell),data=bmt,cause=bmt$cause,
###cens.code=0,cens.model="KM",causeS=1,detail=0,n.sim=1000)
###summary(out) 
###par(mfrow=c(2,3))
###plot(out,sim.ci=2); 
###plot(out,score=1) 




