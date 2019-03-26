library(timereg)


### Name: Gprop.odds
### Title: Fit Generalized Semiparametric Proportional 0dds Model
### Aliases: Gprop.odds
### Keywords: survival

### ** Examples


data(sTRACE)
## No test: 
### runs slowly and is therefore donttest 
data(sTRACE)
# Fits Proportional odds model with stratified baseline
age.c<-scale(sTRACE$age,scale=FALSE); 
out<-Gprop.odds(Surv(time,status==9)~-1+factor(diabetes)+prop(age.c)+prop(chf)+
                prop(sex)+prop(vf),data=sTRACE,max.time=7,n.sim=50)
summary(out) 
par(mfrow=c(2,3))
plot(out,sim.ci=2); plot(out,score=1) 

## End(No test)




