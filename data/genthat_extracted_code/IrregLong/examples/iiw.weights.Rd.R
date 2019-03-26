library(IrregLong)


### Name: iiw.weights
### Title: Compute inverse-intensity weights.
### Aliases: iiw.weights

### ** Examples

library(nlme)
data(Phenobarb)
library(survival)
library(geepack)
Phenobarb$id <- as.numeric(Phenobarb$Subject)
Phenobarb$event <- as.numeric(is.finite(Phenobarb$conc))
Phenobarb.conc <- Phenobarb[is.finite(Phenobarb$conc),]
i <- iiw.weights(Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag + cluster(Subject),
id="id",time="time",event="event",data=Phenobarb.conc,invariant="Subject",
lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=TRUE)
Phenobarb.conc$weight <- i$iiw.weight
summary(i$m)
# can use to fit a weighted GEE
mw <- geeglm(conc ~ time*log(time) , id=Subject, data=Phenobarb.conc, weights=weight)
summary(mw)
# agrees with results through the single command iiwgee
miiwgee <- iiwgee(conc ~ time*log(time),
Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag + cluster(id),
formulanull=NULL,id="id",time="time",event="event",data=Phenobarb.conc,invariant="id",
lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=TRUE)
summary(miiwgee$geefit)



