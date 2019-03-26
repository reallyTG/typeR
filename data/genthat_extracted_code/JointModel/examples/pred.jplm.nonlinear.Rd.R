library(JointModel)


### Name: pred.jplm.nonlinear
### Title: Predict a smoothed nonlinear effect on the longitudinal response
### Aliases: pred.jplm.nonlinear

### ** Examples


#	a simulated data set of longitudinal responses
attach(prostate)
#	a simulated data set of time-to-event (e.g., drop-out process)
attach(dropout)

#	joint fit of a partially linear model and a proportional odds model
#	with a subject-specific random intercept and random slope 
fit1 <- jplm(logPSA.postRT ~ logPSA.base + (1 + VisitTime|ID), 
                 nlm.par=prostate$VisitTime, data.y=prostate, 
                 Surv(DropTime, Status) ~ logPSA.base2, 
                 formula.frailty= ~ 1 + DropTime, 
                 id.vec=dropout$ID2, transf.par=1, data.surv=dropout)

# Evaluate at 20,...,80 percent of the maximum measurement time 	
pts <- c(0.2, 0.4, 0.6, 0.8)*max(prostate$VisitTime)         
pred.jplm.nonlinear(fit1, prostate$VisitTime, at=pts)
out <- pred.jplm.nonlinear(fit1, prostate$VisitTime, at=pts, CI=TRUE)
out$Value	



