library(IrregLong)


### Name: iiwgee
### Title: Fit an inverse-intensity weighted GEE.
### Aliases: iiwgee

### ** Examples

library(nlme)
data(Phenobarb)
library(survival)
library(geepack)
Phenobarb$id <- as.numeric(Phenobarb$Subject)
Phenobarb$event <- as.numeric(is.finite(Phenobarb$conc))
Phenobarb.conc <- Phenobarb[is.finite(Phenobarb$conc),]
miiwgee <- iiwgee(conc ~ time*log(time),
Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag + cluster(id),
formulanull=NULL,id="id",time="time",event="event",data=Phenobarb.conc,invariant="id",
lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=TRUE)
summary(miiwgee$geefit)
summary(miiwgee$phfit)

# compare to results without weighting
m <- geeglm(conc ~ time*log(time) , id=Subject, data=Phenobarb); print(summary(m))
time <- (1:200)
unweighted <- cbind(rep(1,200),time,log(time),time*log(time))%*%m$coefficients
weighted <- cbind(rep(1,200),time,log(time),time*log(time))%*%miiwgee$geefit$coefficients
plot(Phenobarb$time,Phenobarb$conc,xlim=c(0,200),pch=16)
lines(time,unweighted,type="l")
lines(time,weighted,col=2)
legend (0,60,legend=c("Unweighted","Inverse-intensity weighted"),col=1:2,bty="n",lty=1)



