library(MRH)


### Name: DIC
### Title: DIC CALCULATES INFORMATION CRITERION GIVEN THE MCMC CHAINS FROM
###   THE estimateMRH routine.
### Aliases: DIC

### ** Examples

# These MRH fit portion of the examples 
# are from the estimateMRH() help page.  
# They do not need to be re-run if the 
# objects are already in the active workspace.
data(cancer)
cancer$censorvar = cancer$status - 1
## Not run: 
##D fit.lung = estimateMRH(formula = Surv(time, censorvar) ~ 
##D 	age + as.factor(sex) + ph.karno, data = cancer,
##D 	M = 3, maxStudyTime = 960, burnIn = 200, maxIter = 1000, 
##D 	thin = 1, outfolder = 'MRH_lung')
##D 
##D fit.lung.prune = estimateMRH(formula = Surv(time, censorvar) ~ 
##D 	age + as.factor(sex) + ph.karno, data = cancer,
##D 	M = 3, maxStudyTime = 960, burnIn = 200, maxIter = 1000, 
##D 	thin = 1, prune = TRUE, outfolder = 'MRH_lung_prune')
## End(Not run)
	
# Compare the DIC of the pruned and unpruned models.
# The sample size must be entered for calculation of BIC.
# This number can be found in the ``MCMCInfo.txt" file
# in the output folder.
## Not run: 
##D DIC(fit.lung, n = 227)
##D DIC(fit.lung.prune, n = 227)
## End(Not run)



