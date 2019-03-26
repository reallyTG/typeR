library(JointModel)


### Name: jplm
### Title: Joint Partially Linear Model for Longitudinal and Time-to-Event
###   Data
### Aliases: jplm

### ** Examples


# a simulated data set of longitudinal responses
attach(prostate)
# a simulated data set of time-to-event (e.g., drop-out process)
attach(dropout)

# joint fit of a partially linear model and a proportional hazards model 
# with a subject-specific random intercept and random slope
fit0 <- jplm(logPSA.postRT ~ logPSA.base + (1 + VisitTime|ID), 
                 nlm.par=prostate$VisitTime, data.y=prostate, 
                 Surv(DropTime, Status) ~ logPSA.base2, 
                 formula.frailty= ~ 1 + DropTime, 
                 id.vec=dropout$ID2, transf.par=0, data.surv=dropout)
summary(fit0)	



