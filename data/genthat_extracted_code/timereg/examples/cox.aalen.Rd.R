library(timereg)


### Name: cox.aalen
### Title: Fit Cox-Aalen survival model
### Aliases: cox.aalen
### Keywords: survival

### ** Examples


library(timereg)
data(sTRACE)
# Fits Cox model 
out<-cox.aalen(Surv(time,status==9)~prop(age)+prop(sex)+
prop(vf)+prop(chf)+prop(diabetes),data=sTRACE)

# makes Lin, Wei, Ying test for proportionality
summary(out)
par(mfrow=c(2,3))
plot(out,score=1) 

# Fits stratified Cox model 
out<-cox.aalen(Surv(time,status==9)~-1+factor(vf)+ prop(age)+prop(sex)+
	       prop(chf)+prop(diabetes),data=sTRACE,max.time=7,n.sim=100)
summary(out)
par(mfrow=c(1,2)); plot(out); 
# Same model, but needs to invert the entire marix for the aalen part: X(t) 
out<-cox.aalen(Surv(time,status==9)~factor(vf)+ prop(age)+prop(sex)+
	       prop(chf)+prop(diabetes),data=sTRACE,max.time=7,n.sim=100)
summary(out)
par(mfrow=c(1,2)); plot(out); 


# Fits Cox-Aalen model 
out<-cox.aalen(Surv(time,status==9)~prop(age)+prop(sex)+
               vf+chf+prop(diabetes),data=sTRACE,max.time=7,n.sim=100)
summary(out)
par(mfrow=c(2,3))
plot(out)




