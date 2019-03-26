library(frailtypack)


### Name: Diffepoce
### Title: Difference of Expected Prognostic Observed Cross-Entropy (EPOCE)
###   estimators and its 95% tracking interval between two joint models.
### Aliases: Diffepoce
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D #Example for joint frailty models
##D data(readmission)
##D 
##D # first joint frailty model
##D joint1 <- frailtyPenal(Surv(t.start,t.stop,event)~ cluster(id) +
##D   dukes + charlson + sex + chemo + terminal(death),
##D   formula.terminalEvent = ~ dukes + charlson + sex + chemo ,
##D   data = readmission, n.knots = 8, kappa = c(2.11e+08,9.53e+11),
##D   recurrentAG=TRUE)
##D 
##D # second joint frailty model without dukes nor charlson as covariates
##D joint2 <- frailtyPenal(Surv(t.start,t.stop,event)~ cluster(id) +
##D   sex + chemo + terminal(death),
##D   formula.terminalEvent = ~ sex + chemo ,
##D   data = readmission, n.knots = 8, kappa = c(2.11e+08,9.53e+11),
##D   recurrentAG=TRUE)
##D 
##D temps <- c(200,500,800,1100)
##D 
##D # computation of estimators of EPOCE for the two models
##D epoce1 <- epoce(joint1,temps)
##D epoce2 <- epoce(joint2,temps)
##D 
##D # computation of the difference
##D diff <- Diffepoce(epoce1,epoce2)
##D 
##D print(diff)
##D plot(diff)
##D 
##D 
##D #Example for joint models with a biomarker
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D # Survival data preparation - only terminal events 
##D colorectalSurv <- subset(colorectal, new.lesions == 0)
##D 
##D # first joint model for a biomarker and a terminal event
##D modLongi <- longiPenal(Surv(time0, time1, state) ~ age +
##D treatment + who.PS, tumor.size ~  year*treatment + age +
##D who.PS, colorectalSurv, data.Longi =colorectalLongi,
##D random = c("1", "year"),  id = "id", link = "Random-effects", 
##D left.censoring = -3.33, hazard = "Weibull", 
##D method.GH = "Pseudo-adaptive")
##D 
##D # second joint model for a biomarker, recurrent events and a terminal event
##D # (computation takes around 30 minutes)
##D modTriv <- model.weib.RE.gap <-trivPenal(Surv(gap.time, new.lesions) 
##D ~ cluster(id) + age + treatment + who.PS + prev.resection + terminal(state),
##D formula.terminalEvent =~ age + treatment + who.PS + prev.resection, 
##D tumor.size ~ year * treatment + age + who.PS, data = colorectal,
##D data.Longi = colorectalLongi, random = c("1", "year"), id = "id", 
##D link = "Random-effects", left.censoring = -3.33, recurrentAG = FALSE,
##D hazard = "Weibull", method.GH="Pseudo-adaptive", n.nodes=7)
##D 
##D time <- c(1, 1.5, 2, 2.5)
##D 
##D # computation of estimators of EPOCE for the two models
##D epoce1 <- epoce(modLongi, time)
##D # (computation takes around 10 minutes)
##D epoce2 <- epoce(modTriv, time)
##D 
##D 
##D # computation of the difference
##D diff <- Diffepoce(epoce1, epoce2)
##D 
##D print(diff)
##D plot(diff)
## End(Not run)





