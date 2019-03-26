library(frailtypack)


### Name: summary.longiPenal
### Title: Short summary of fixed covariates estimates of a joint model for
###   longitudinal data and a terminal event
### Aliases: summary.longiPenal print.summary.longiPenal
### Keywords: methods

### ** Examples



## Not run: 
##D ###--- Joint model for longitudinal data and a terminal event ---###
##D 
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D # Survival data preparation - only terminal events 
##D colorectalSurv <- subset(colorectal, new.lesions == 0)
##D 
##D # Baseline hazard function approximated with splines
##D # Random effects as the link function
##D 
##D model.spli.RE <- longiPenal(Surv(time1, state) ~ age + treatment + who.PS 
##D + prev.resection, tumor.size ~  year * treatment + age + who.PS ,
##D colorectalSurv,	data.Longi = colorectalLongi, random = c("1", "year"),
##D id = "id", link = "Random-effects", left.censoring = -3.33, 
##D n.knots = 7, kappa = 2)
##D 
##D # Weibull baseline hazard function
##D # Current level of the biomarker as the link function
##D 
##D model.weib.CL <- longiPenal(Surv(time1, state) ~ age + treatment + who.PS
##D + prev.resection, tumor.size ~  year * treatment + age + who.PS , 
##D colorectalSurv, data.Longi = colorectalLongi, random = c("1", "year"),
##D id = "id", link = "Current-level", left.censoring = -3.33, hazard = "Weibull")
##D 	
##D summary(model.spli.RE)
##D summary(model.weib.CL)
## End(Not run)





