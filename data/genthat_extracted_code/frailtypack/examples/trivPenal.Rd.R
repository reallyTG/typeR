library(frailtypack)


### Name: trivPenal
### Title: Fit a Trivariate Joint Model for Longitudinal Data, Recurrent
###   Events and a Terminal Event
### Aliases: trivPenal
### Keywords: models

### ** Examples



## Not run: 
##D 
##D ###--- Trivariate joint model for longitudinal data, ---###
##D ###--- recurrent events and a terminal event ---###
##D 
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D # Parameter initialisation for covariates - longitudinal and terminal part
##D 
##D # Survival data preparation - only terminal events 
##D colorectalSurv <- subset(colorectal, new.lesions == 0)
##D 
##D initial.longi <- longiPenal(Surv(time1, state) ~ age + treatment + who.PS 
##D + prev.resection, tumor.size ~  year * treatment + age + who.PS ,
##D colorectalSurv,	data.Longi = colorectalLongi, random = c("1", "year"),
##D id = "id", link = "Random-effects", left.censoring = -3.33, 
##D n.knots = 6, kappa = 2, method.GH="Pseudo-adaptive",
##D  maxit=40, n.nodes=7)
##D 
##D 
##D # Parameter initialisation for covariates - recurrent part
##D initial.frailty <- frailtyPenal(Surv(time0, time1, new.lesions) ~ cluster(id)
##D + age + treatment + who.PS, data = colorectal,
##D recurrentAG = TRUE, RandDist = "LogN", n.knots = 6, kappa =2)
##D 
##D 
##D # Baseline hazard function approximated with splines
##D # Random effects as the link function, Calendar timescale
##D # (computation takes around 40 minutes)
##D 
##D model.spli.RE.cal <-trivPenal(Surv(time0, time1, new.lesions) ~ cluster(id)
##D + age + treatment + who.PS +  terminal(state),
##D formula.terminalEvent =~ age + treatment + who.PS + prev.resection, 
##D tumor.size ~ year * treatment + age + who.PS, data = colorectal, 
##D data.Longi = colorectalLongi, random = c("1", "year"), id = "id", 
##D link = "Random-effects", left.censoring = -3.33, recurrentAG = TRUE,
##D n.knots = 6, kappa=c(0.01, 2), method.GH="Standard", n.nodes = 7,
##D init.B = c(-0.07, -0.13, -0.16, -0.17, 0.42, #recurrent events covariates
##D -0.16, -0.14, -0.14, 0.08, 0.86, -0.24, #terminal event covariates
##D 2.93, -0.28, -0.13, 0.17, -0.41, 0.23, 0.97, -0.61)) #biomarker covariates
##D 
##D 
##D 
##D # Weibull baseline hazard function
##D # Random effects as the link function, Gap timescale
##D # (computation takes around 30 minutes)
##D model.weib.RE.gap <-trivPenal(Surv(gap.time, new.lesions) ~ cluster(id)
##D + age + treatment + who.PS + prev.resection + terminal(state),
##D formula.terminalEvent =~ age + treatment + who.PS + prev.resection, 
##D tumor.size ~ year * treatment + age + who.PS, data = colorectal,
##D data.Longi = colorectalLongi, random = c("1", "year"), id = "id", 
##D link = "Random-effects", left.censoring = -3.33, recurrentAG = FALSE,
##D hazard = "Weibull", method.GH="Pseudo-adaptive",n.nodes=7)
##D 
##D 
## End(Not run)





