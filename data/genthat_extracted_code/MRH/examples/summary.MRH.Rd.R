library(MRH)


### Name: summary.MRH
### Title: Summarizes the results of an MRH object
### Aliases: summary.MRH

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
	
# Summarize the models
## Not run: 
##D summary(fit.lung)
##D summary(fit.lung, alpha.level = .01)
##D 
##D # Read in from the saved output file, converting to an MRH object,
##D # then summarize.
##D mcmc.lung = as.MRH(read.table('MRH_lung/MCMCchains.txt', header = TRUE))
##D summary(mcmc.lung, maxStudyTime = 960)
##D summary(mcmc.lung, maxStudyTime = 960, alpha.level = .01)
## End(Not run)



