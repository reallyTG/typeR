library(timereg)


### Name: pava.pred
### Title: Make predictions of predict functions in rows mononotone
### Aliases: pava.pred
### Keywords: survival

### ** Examples


data(bmt); 

## competing risks 
add<-comp.risk(Event(time,cause)~platelet+age+tcell,data=bmt,cause=1)
ndata<-data.frame(platelet=c(1,0,0),age=c(0,1,0),tcell=c(0,0,1))
out<-predict(add,newdata=ndata,uniform=0)

par(mfrow=c(1,1))
head(out$P1)
matplot(out$time,t(out$P1),type="s")

###P1m <- t(apply(out$P1,1,pava))
P1monotone <- pava.pred(out$P1)
head(P1monotone)
matlines(out$time,t(P1monotone),type="s")




