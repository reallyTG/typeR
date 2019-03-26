library(frailtypack)


### Name: plot.longiPenal
### Title: Plot Method for a joint model for longitudinal data and a
###   terminal event.
### Aliases: plot.longiPenal lines.longiPenal
### Keywords: file

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
##D pdf(file = "/home/agareb1/etudiants/al10/newpack/test/plot_longi.pdf")
##D 
##D # Plot the estimated baseline hazard function with the confidence intervals
##D plot(model.spli.RE)	
##D 
##D # Plot the estimated baseline hazard function with the confidence intervals
##D plot(model.spli.RE, type = "Survival")	
## End(Not run)





