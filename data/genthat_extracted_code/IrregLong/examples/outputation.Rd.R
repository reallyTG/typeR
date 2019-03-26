library(IrregLong)


### Name: outputation
### Title: Create an outputted dataset for use with multiple outputation.
### Aliases: outputation

### ** Examples

library(nlme)
data(Phenobarb)
library(survival)
library(geepack)
Phenobarb$id <- as.numeric(Phenobarb$Subject)
Phenobarb$event <- as.numeric(is.finite(Phenobarb$conc))
Phenobarb.conc <- Phenobarb[is.finite(Phenobarb$conc),]
i <- iiw.weights(Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag + cluster(Subject),
id="Subject",time="time",event="event",data=Phenobarb.conc,invariant="Subject",
lagvars=c("time","conc"),maxfu=NULL,lagfirst=0,first=TRUE)
Phenobarb.conc$weight <- i$iiw.weight
head(Phenobarb.conc)
data.output1 <-   outputation(Phenobarb.conc,Phenobarb.conc$weight,singleobs=FALSE,
id="id",time="time",keep.first=FALSE)
head(data.output1)
data.output2 <-   outputation(Phenobarb.conc,Phenobarb.conc$weight,singleobs=FALSE,
id="id",time="time",keep.first=FALSE)
head(data.output2)
data.output3 <-   outputation(Phenobarb.conc,Phenobarb.conc$weight,singleobs=FALSE,
id="id",time="time",keep.first=FALSE)
head(data.output3)
# Note that the outputted dataset varies with each command run; outputation is done at random



