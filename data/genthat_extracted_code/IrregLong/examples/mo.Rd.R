library(IrregLong)


### Name: mo
### Title: Multiple outputation for longitudinal data subject to irregular
###   observation.
### Aliases: mo

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
reg <- function(data){
 	return(data.matrix(summary(geeglm(conc ~ time*log(time) ,
 	id=Subject, data=data))$coefficients[,1:2]))
 }

mo(20,reg,Phenobarb.conc,Phenobarb.conc$weight,singleobs=FALSE,id="id",time="time",keep.first=FALSE)
# does not yield valid variance estimates
# once thinned the dataset contains fewer than 30 subjects for most outputations,
# so the sandwich variance estimate from the GEE is too small



