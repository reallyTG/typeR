library(timereg)


### Name: comp.risk
### Title: Competings Risks Regression
### Aliases: comp.risk
### Keywords: survival

### ** Examples


data(bmt); 

clust <- rep(1:204,each=2)
addclust<-comp.risk(Event(time,cause)~platelet+age+tcell+cluster(clust),data=bmt,
cause=1,resample.iid=1,n.sim=100,model="additive")
###

addclust<-comp.risk(Event(time,cause)~+1+cluster(clust),data=bmt,cause=1,
		    resample.iid=1,n.sim=100,model="additive")
pad <- predict(addclust,X=1)
plot(pad)

add<-comp.risk(Event(time,cause)~platelet+age+tcell,data=bmt,
cause=1,resample.iid=1,n.sim=100,model="additive")
summary(add)

par(mfrow=c(2,4))
plot(add); 
### plot(add,score=1) ### to plot score functions for test

ndata<-data.frame(platelet=c(1,0,0),age=c(0,1,0),tcell=c(0,0,1))
par(mfrow=c(2,3))
out<-predict(add,ndata,uniform=1,n.sim=100)
par(mfrow=c(2,2))
plot(out,multiple=0,uniform=1,col=1:3,lty=1,se=1)

add<-comp.risk(Event(time,cause)~platelet+age+tcell,data=bmt,
	       cause=1,resample.iid=0,n.sim=0,cens.model="cox",
	       cens.formula=~factor(platelet),model="additive")

out<-predict(add,ndata,se=0,uniform=0)
par(mfrow=c(2,2))
plot(out,multiple=0,se=0,uniform=0,col=1:3,lty=1)

## fits additive model with some constant effects 
add.sem<-comp.risk(Event(time,cause)~
const(platelet)+const(age)+const(tcell),data=bmt,
cause=1,resample.iid=1,n.sim=100,model="additive")
summary(add.sem)

out<-predict(add.sem,ndata,uniform=1,n.sim=100)
par(mfrow=c(2,2))
plot(out,multiple=0,uniform=1,col=1:3,lty=1,se=0)

## Fine & Gray model 
fg<-comp.risk(Event(time,cause)~
const(platelet)+const(age)+const(tcell),data=bmt,
cause=1,resample.iid=1,model="fg",n.sim=100)
summary(fg)

out<-predict(fg,ndata,uniform=1,n.sim=100)

par(mfrow=c(2,2))
plot(out,multiple=1,uniform=0,col=1:3,lty=1,se=0)

## extended model with time-varying effects
fg.npar<-comp.risk(Event(time,cause)~platelet+age+const(tcell),
data=bmt,cause=1,resample.iid=1,model="prop",n.sim=100)
summary(fg.npar); 

out<-predict(fg.npar,ndata,uniform=1,n.sim=100)
head(out$P1[,1:5]); head(out$se.P1[,1:5])

par(mfrow=c(2,2))
plot(out,multiple=1,uniform=0,col=1:3,lty=1,se=0)

## Fine & Gray model with alternative parametrization for baseline
fg2<-comp.risk(Event(time,cause)~const(platelet)+const(age)+const(tcell),data=bmt,
cause=1,resample.iid=1,model="prop",n.sim=100)
summary(fg2)

#################################################################
## Delayed entry models, 
#################################################################
nn <- nrow(bmt)
entrytime <- rbinom(nn,1,0.5)*(bmt$time*runif(nn))
bmt$entrytime <- entrytime
times <- seq(5,70,by=1)

bmtw <- prep.comp.risk(bmt,times=times,time="time",entrytime="entrytime",cause="cause")

## non-parametric model 
outnp <- comp.risk(Event(time,cause)~tcell+platelet+const(age),
		   data=bmtw,cause=1,fix.gamma=1,gamma=0,
 cens.weights=bmtw$cw,weights=bmtw$weights,times=times,n.sim=0)
par(mfrow=c(2,2))
plot(outnp)

outnp <- comp.risk(Event(time,cause)~tcell+platelet,
		   data=bmtw,cause=1,
 cens.weights=bmtw$cw,weights=bmtw$weights,times=times,n.sim=0)
par(mfrow=c(2,2))
plot(outnp)


## semiparametric model 
out <- comp.risk(Event(time,cause)~const(tcell)+const(platelet),data=bmtw,cause=1,
 cens.weights=bmtw$cw,weights=bmtw$weights,times=times,n.sim=0)
summary(out)





