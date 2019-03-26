library(MRH)


### Name: estimateMRH
### Title: Joint estimation of the hazard rate and covariate effects using
###   multi-resolution hazard methodology
### Aliases: estimateMRH

### ** Examples

#####################################################
# NOTE: Examples may take a few minutes, so please be
# patient. In addition, warning messages about
# convergence may appear as more iterations are
# typically needed for chain convergence.  
	
########### PROPORTIONAL HAZARDS EXAMPLE ############
# Examine the NCCTG lung cancer data set (from the survival package),  
# and quantify how age, gender, and physician rated 
# Karnofsky performance scores affect survival times (in days).  
# Assume the hazards are proportional for all covariates.

data(cancer)

# Adjust "status" so that it is a 0/1 
# variable (currently it is 1 = censored, 2 = observed death)
cancer$censorvar = cancer$status - 1

# Run the estimateMRH routine.  Set the maximum 
# study time to 960 days, which makes each bin
# 120 days long.  This censors 0 extra subjects 
# (see FindBinWidth() for an example).  Save
# the output in a folder titled 'MRH_lung' 
# (default is 'MRHresults').
# Generally it is recommended to use a higher burn-in value, 
# thinning value, and maximum number
# of iterations, but for illustrative purposes 
# these values have been lowered.
# Note that the routine may produce a warning 
# message that the algorithm has not converged,
# as typically more iterations are needed for convergence.
# However, for the purposes of this example, the number
# of iterations is sufficient.
## Not run: 
##D fit.lung = estimateMRH(formula = Surv(time, censorvar) ~ 
##D 	age + as.factor(sex) + ph.karno, data = cancer,
##D 	M = 3, maxStudyTime = 960, burnIn = 200, maxIter = 1000, 
##D 	thin = 1, outfolder = 'MRH_lung')
## End(Not run)
## Don't show: 
fit.lung = estimateMRH(formula = Surv(time, censorvar) ~ 
	age + as.factor(sex) + ph.karno, data = cancer,
	M = 2, maxStudyTime = 960, burnIn = 50, maxIter = 100, 
	thin = 1, outfolder = 'MRH_lung')
## End(Don't show)

# See all items returned in the model fit
## Not run: 
##D 	fit.lung
## End(Not run)
# See the main summary
## Not run: 
##D fit.lung$summary
## End(Not run)
# NOTE: If estimateMRH is run as a background job, 
# or if the output folder has been saved for use
# at a later instance, then  the fit can be calculated 
# using the as.MRH() and summary.MRH() functions.  
# See the those help pages or the vignette for 
# more information.

# Run the same model as above, but with pruning. 
# Save the output in a folder titled 'MRH_lung_prune'
## Not run: 
##D fit.lung.prune = estimateMRH(formula = Surv(time, censorvar) ~ 
##D 	age + as.factor(sex) + ph.karno, data = cancer,
##D 	M = 3, maxStudyTime = 960, burnIn = 200, maxIter = 1000, 
##D 	thin = 1, prune = TRUE, outfolder = 'MRH_lung_prune')
## End(Not run)


########### NON-PROPORTIONAL HAZARDS EXAMPLE ############
# Examine the tongue data set (from the KMsurv package), and
# quantify how the rumor DNA profile 
# affects survival time (in weeks).
data(tongue)

# Fit the MRH model, including tumor type using 
# the non-proportional hazards model.  
# With 16 bins (M = 4), each bin represents 25 weeks.
# Generally it is recommended to use a higher burn-in value, 
# thinning value, and maximum number
# of iterations, but for illustrative purposes 
# these values have been lowered.
# Note that the routine may produce a warning 
# message that the algorithm has not converged,
# as typically more iterations are needed for convergence.
# However, for the purposes of this example, the number
# of iterations is sufficient.
## Not run: 
##D fit.tongue = estimateMRH(formula = Surv(time, delta) ~ 
##D 	nph(type), data = tongue, M = 4, 
##D 	burnIn = 200, maxIter = 2000, thin = 1, 
##D 	outfolder = 'MRH_tongue_nph')
## End(Not run)

# Get the time-varying hazard ratios 
## Not run: 
##D 	fit.tongue$beta
## End(Not run)



