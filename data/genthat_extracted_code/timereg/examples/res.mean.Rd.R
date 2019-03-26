library(timereg)


### Name: res.mean
### Title: Residual mean life (restricted)
### Aliases: res.mean
### Keywords: survival

### ** Examples


data(bmt); 
tau <- 100 

### residual restricted mean life
out<-res.mean(Event(time,cause>=1)~factor(tcell)+factor(platelet),data=bmt,cause=1,
	      times=0,restricted=tau,n.sim=0,model="additive",estimator=1); 
summary(out)

out<-res.mean(Event(time,cause>=1)~factor(tcell)+factor(platelet),data=bmt,cause=1,
	      times=seq(0,90,5),restricted=tau,n.sim=0,model="additive",estimator=1); 
par(mfrow=c(1,3))
plot(out)

### restricted years lost given death
out21<-res.mean(Event(time,cause)~factor(tcell)+factor(platelet),data=bmt,cause=1,
	      times=0,restricted=tau,n.sim=0,model="additive",estimator=2); 
summary(out21)
out22<-res.mean(Event(time,cause)~factor(tcell)+factor(platelet),data=bmt,cause=2,
	      times=0,restricted=tau,n.sim=0,model="additive",estimator=2); 
summary(out22)


### total restricted years lost 
out31<-res.mean(Event(time,cause)~factor(tcell)+factor(platelet),data=bmt,cause=1,
	      times=0,restricted=tau,n.sim=0,model="additive",estimator=3); 
summary(out31)
out32<-res.mean(Event(time,cause)~factor(tcell)+factor(platelet),data=bmt,cause=2,
	      times=0,restricted=tau,n.sim=0,model="additive",estimator=3); 
summary(out32)


### delayed entry 
nn <- nrow(bmt)
entrytime <- rbinom(nn,1,0.5)*(bmt$time*runif(nn))
bmt$entrytime <- entrytime

bmtw <- prep.comp.risk(bmt,times=tau,time="time",entrytime="entrytime",cause="cause")

out<-res.mean(Event(time,cause>=1)~factor(tcell)+factor(platelet),data=bmtw,cause=1,
	      times=0,restricted=tau,n.sim=0,model="additive",estimator=1,
              cens.model="weights",weights=bmtw$cw,cens.weights=1/bmtw$weights); 
summary(out)




