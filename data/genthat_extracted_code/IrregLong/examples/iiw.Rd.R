library(IrregLong)


### Name: iiw
### Title: Given a proportional hazards model for visit intensities,
###   compute inverse-intensity weights.
### Aliases: iiw

### ** Examples

library(nlme)
data(Phenobarb)
library(survival)
library(geepack)
Phenobarb$id <- as.numeric(Phenobarb$Subject)
Phenobarb$event <- as.numeric(is.finite(Phenobarb$conc))
Phenobarb.conc <- Phenobarb[is.finite(Phenobarb$conc),]
Phenobarb.conc <- lagfn(Phenobarb.conc,c("time","conc"),"id","time")

mph <- coxph(Surv(time.lag,time,event)~I(conc.lag>0) + conc.lag + cluster(id),data=Phenobarb.conc)
summary(mph)
Phenobarb.conc$weight <- iiw(mph,Phenobarb.conc,"id","time",TRUE)
head(Phenobarb)



