library(MRH)


### Name: CalcFunction
### Title: CALCFUNCTION CALCULATES THE HAZARD RATE, CUMULATIVE HAZARD
###   AND/OR SURVIVAL FUNCTION OF AN MRH OBJECT
### Aliases: CalcFunction

### ** Examples

# The MRH fit portion of the example is from 
# the estimateMRH() help page.  They do not need to 
# be re-run if the code has previously 
# been run and the outfolder ('MRH_lung') is saved.
data(cancer)
cancer$censorvar = cancer$status - 1
## Not run: 
##D fit.lung = estimateMRH(formula = Surv(time, censorvar) ~ 
##D 	age + as.factor(sex) + ph.karno, data = cancer,
##D 	M = 3, maxStudyTime = 960, burnIn = 200, 
##D 	maxIter = 1000, thin = 1, outfolder = 'MRH_lung')
## End(Not run)

# Get the cumulative hazard with 99% credible interval bounds
## Not run: 
##D CalcFunction(fit.lung, function.type = 'H', 
##D 	alpha.level = .01)
## End(Not run)

# Get the hazard rate, cumulative hazard, and 
# survival function using the MCMC chains text file
## Not run: 
##D lung.chains = MRH(read.table('MRH_lung/MCMCchains.txt', header = TRUE))
## End(Not run)

# When the chains are read in from a file and used, 
# the maximum study time 
# must be entered to calculate the hazard rate.
# (i.e. CalcFunction(lung.chains) does not work)
## Not run: 
##D CalcFunction(lung.chains, maxStudyTime = 960)
## End(Not run)



