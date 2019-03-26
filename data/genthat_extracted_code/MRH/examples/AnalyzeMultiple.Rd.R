library(MRH)


### Name: AnalyzeMultiple
### Title: ANALYZE MULTIPLE MCMC CHAINS
### Aliases: AnalyzeMultiple

### ** Examples

# Generate 3 chains for the same model.  
# Set GR = TRUE so that the burn-in number, 
# thinning value, 
# and maximum number of iterations are the same 
# across all MCMC chains, and so that initialized 
# parameter values cover the parameter space.

# Note that the routine may produce a warning 
# message that the algorithm has not converged,
# as typically more iterations are needed for convergence.
# However, for the purposes of this example, the number
# of iterations is sufficient.

data(cancer)
cancer$censorvar = cancer$status - 1
## Not run: 
##D fit.lung1 = estimateMRH(formula = Surv(time, censorvar) ~ 
##D 	age + as.factor(sex) + ph.karno, data = cancer,
##D 	M = 3, maxStudyTime = 960, burnIn = 200, maxIter = 1000, 
##D 	thin = 1, outfolder = 'MRH_lung1', GR = TRUE)
##D fit.lung2 = estimateMRH(formula = Surv(time, censorvar) ~ 
##D 	age + as.factor(sex) + ph.karno, data = cancer,
##D 	M = 3, maxStudyTime = 960, burnIn = 200, maxIter = 1000, 
##D 	thin = 1, outfolder = 'MRH_lung2', GR = TRUE)
##D fit.lung3 = estimateMRH(formula = Surv(time, censorvar) ~ 
##D 	age + as.factor(sex) + ph.karno, data = cancer,
##D 	M = 3, maxStudyTime = 960, burnIn = 200, maxIter = 1000, 
##D 	thin = 1, outfolder = 'MRH_lung2', GR = TRUE)
## End(Not run)

# Calculate the results of all three chains and the 
# scale reduction factor entering the data sets in a list
## Not run: 
##D AnalyzeMultiple(datalist = 
##D 	list(read.table('MRH_lung1/MCMCchains.txt', header = TRUE), 
##D 	read.table('MRH_lung2/MCMCchains.txt', header = TRUE),
##D 	read.table('MRH_lung2/MCMCchains.txt', header = TRUE)), 
##D 	maxStudyTime = 960)
## End(Not run)

# Calculate the results of all three chains and the 
# scale reduction factor entering the data file names
## Not run: 
##D AnalyzeMultiple(fileNames = c('MRH_lung1/MCMCchains.txt', 
##D 				'MRH_lung2/MCMCchains.txt', 'MRH_lung2/MCMCchains.txt'), 
##D 				maxStudyTime = 960)
## End(Not run)



