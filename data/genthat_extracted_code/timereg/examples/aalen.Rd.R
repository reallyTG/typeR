library(timereg)


### Name: aalen
### Title: Fit additive hazards model
### Aliases: aalen
### Keywords: survival

### ** Examples


data(sTRACE)
# Fits Aalen model 
out<-aalen(Surv(time,status==9)~age+sex+diabetes+chf+vf,
sTRACE,max.time=7,n.sim=100)

summary(out)
par(mfrow=c(2,3))
plot(out)

# Fits semi-parametric additive hazards model 
out<-aalen(Surv(time,status==9)~const(age)+const(sex)+const(diabetes)+chf+vf,
sTRACE,max.time=7,n.sim=100)

summary(out)
par(mfrow=c(2,3))
plot(out)

## Excess risk additive modelling 
data(mela.pop)
dummy<-rnorm(nrow(mela.pop));

# Fits Aalen model  with offsets 
out<-aalen(Surv(start,stop,status==1)~age+sex+const(dummy),
mela.pop,max.time=7,n.sim=100,offsets=mela.pop$rate,id=mela.pop$id,
gamma=0)
summary(out)
par(mfrow=c(2,3))
plot(out,main="Additive excess riks model")

# Fits semi-parametric additive hazards model  with offsets 
out<-aalen(Surv(start,stop,status==1)~age+const(sex),
mela.pop,max.time=7,n.sim=100,offsets=mela.pop$rate,id=mela.pop$id)
summary(out)
plot(out,main="Additive excess riks model")




