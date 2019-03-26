library(frailtypack)


### Name: summary.trivPenal
### Title: Short summary of fixed covariates estimates of a joint model for
###   longitudinal data, recurrent events and a terminal event
### Aliases: summary.trivPenal print.summary.trivPenal
### Keywords: methods

### ** Examples



## Not run: 
##D 
##D ###--- Trivariate joint model for longitudinal data, ---###
##D ###--- recurrent events and a terminal event ---###
##D 
##D data(colorectal)
##D data(colorectalLongi)
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
##D hazard = "Weibull", method.GH="Pseudo-adaptive", n.nodes = 7)
##D 
##D summary(model.weib.RE.gap)
## End(Not run)





