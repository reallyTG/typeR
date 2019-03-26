library(MRH)


### Name: plot.MRH
### Title: Plots the hazard rate (with credible bands) of an MRH object.
### Aliases: plot.MRH

### ** Examples

# These MRH fit portion of the examples are from the 
# estimateMRH() help page.  
# They do not need to be re-run if the objects 
# are already in the active workspace.
data(cancer)
cancer$censorvar = cancer$status - 1
## Not run: 
##D fit.lung = estimateMRH(formula = Surv(time, censorvar) ~ 
##D 	age + as.factor(sex) + ph.karno, data = cancer,
##D 	M = 3, maxStudyTime = 960, burnIn = 200, maxIter = 1000, 
##D 	thin = 1, outfolder = 'MRH_lung')
## End(Not run)

data(tongue)
## Not run: 
##D fit.tongue = estimateMRH(formula = Surv(time, delta) ~ 
##D 	nph(type), data = tongue, M = 4, 
##D 	burnIn = 200, maxIter = 2000, thin = 1, outfolder = 'MRH_tongue_nph')
## End(Not run)
	
# Plot the hazard rate, cumulative hazard, 
# and survival function of the lung model side-by-side:
## Not run: 
##D par(mfrow = c(1,3))
##D plot(fit.lung, main = 'Hazard rate')
##D plot(fit.lung, plot.type = 'H', main = 'Cumulative hazard')
##D plot(fit.lung, plot.type = 'S', main = 'Survival function')
## End(Not run)

# Plot the hazard rates for the tongue (i.e. non-proportional hazards) 
# model with smoothed estimates.
## Not run: 
##D plot(fit.tongue, smooth.graph = TRUE)
## End(Not run)
# Separate the graphs for less crowding
## Not run: 
##D plot(fit.tongue, smooth.graph = TRUE, combine.graphs = FALSE)
## End(Not run)
# Plot the hazard ratios
## Not run: 
##D plot(fit.tongue, plot.type = 'r')
## End(Not run)

# Plot the hazard rate of the lung model using the chains. 
# This requires maxStudyTime to be entered.
## Not run: 
##D lung.chains = MRH(read.table('MRH_lung/MCMCchains.txt', header = TRUE))
##D plot(lung.chains, maxStudyTime = 960)
## End(Not run)



