library(JointModel)


### Name: pred.jplm.cumhaz
### Title: Predict the baseline cumulative hazard function at any given
###   time point
### Aliases: pred.jplm.cumhaz

### ** Examples


#	a simulated data set of longitudinal responses
attach(prostate)
#	a simulated data set of drop-out process (or, time-to-event)
attach(dropout)

#	joint fit of a partially linear model and a proportional odds model
#	with a subject-specific random intercept and random slope 
fit1 <- jplm(logPSA.postRT ~ logPSA.base + (1 + VisitTime|ID), 
                 nlm.par=prostate$VisitTime, data.y=prostate, 
                 Surv(DropTime, Status) ~ logPSA.base2, 
                 formula.frailty= ~ 1 + DropTime, 
                 id.vec=dropout$ID2, transf.par=1, data.surv=dropout)

# Evaluate at 20,...,80 percent of the maximum observed survival time 	
pts <- c(0.2, 0.4, 0.6, 0.8)*max(dropout$DropTime)  
pred.jplm.cumhaz(fit1, at=pts)
out <- pred.jplm.cumhaz(fit1, at=pts, CI=TRUE)
out$Value	



