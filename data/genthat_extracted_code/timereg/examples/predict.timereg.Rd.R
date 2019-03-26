library(timereg)


### Name: predict.timereg
### Title: Predictions for Survival and Competings Risks Regression for
###   timereg
### Aliases: predict.timereg predict.aalen predict.comprisk
###   predict.cox.aalen
### Keywords: survival

### ** Examples


data(bmt); 

## competing risks 
add<-comp.risk(Event(time,cause)~platelet+age+tcell,data=bmt,cause=1)

ndata<-data.frame(platelet=c(1,0,0),age=c(0,1,0),tcell=c(0,0,1))
out<-predict(add,newdata=ndata,uniform=1,n.sim=1000)
par(mfrow=c(2,2))
plot(out,multiple=0,uniform=1,col=1:3,lty=1,se=1)
# see comp.risk for further examples. 

add<-comp.risk(Event(time,cause)~factor(tcell),data=bmt,cause=1)
summary(add)
out<-predict(add,newdata=ndata,uniform=1,n.sim=1000)
plot(out,multiple=1,uniform=1,col=1:3,lty=1,se=1)

add<-prop.odds.subdist(Event(time,cause)~factor(tcell),
	       data=bmt,cause=1)
out <- predict(add,X=1,Z=1)
plot(out,multiple=1,uniform=1,col=1:3,lty=1,se=1)


## SURVIVAL predictions aalen function
data(sTRACE)
out<-aalen(Surv(time,status==9)~sex+ diabetes+chf+vf,
data=sTRACE,max.time=7,n.sim=0,resample.iid=1)

pout<-predict(out,X=rbind(c(1,0,0,0,0),rep(1,5)))
head(pout$S0[,1:5]); head(pout$se.S0[,1:5])
par(mfrow=c(2,2))
plot(pout,multiple=1,se=0,uniform=0,col=1:2,lty=1:2)
plot(pout,multiple=0,se=1,uniform=1,col=1:2)

out<-aalen(Surv(time,status==9)~const(age)+const(sex)+
const(diabetes)+chf+vf,
data=sTRACE,max.time=7,n.sim=0,resample.iid=1)

pout<-predict(out,X=rbind(c(1,0,0),c(1,1,0)),
Z=rbind(c(55,0,1),c(60,1,1)))
head(pout$S0[,1:5]); head(pout$se.S0[,1:5])
par(mfrow=c(2,2))
plot(pout,multiple=1,se=0,uniform=0,col=1:2,lty=1:2)
plot(pout,multiple=0,se=1,uniform=1,col=1:2)

pout<-predict(out,uniform=0,se=0,newdata=sTRACE[1:10,]) 
plot(pout,multiple=1,se=0,uniform=0)

#### cox.aalen
out<-cox.aalen(Surv(time,status==9)~prop(age)+prop(sex)+
prop(diabetes)+chf+vf,
data=sTRACE,max.time=7,n.sim=0,resample.iid=1)

pout<-predict(out,X=rbind(c(1,0,0),c(1,1,0)),Z=rbind(c(55,0,1),c(60,1,1)))
head(pout$S0[,1:5]); head(pout$se.S0[,1:5])
par(mfrow=c(2,2))
plot(pout,multiple=1,se=0,uniform=0,col=1:2,lty=1:2)
plot(pout,multiple=0,se=1,uniform=1,col=1:2)

pout<-predict(out,uniform=0,se=0,newdata=sTRACE[1:10,]) 
plot(pout,multiple=1,se=0,uniform=0)

#### prop.odds model 
add<-prop.odds(Event(time,cause!=0)~factor(tcell),data=bmt)
out <- predict(add,X=1,Z=0)
plot(out,multiple=1,uniform=1,col=1:3,lty=1,se=1)




