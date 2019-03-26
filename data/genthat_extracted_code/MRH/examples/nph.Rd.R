library(MRH)


### Name: nph
### Title: INTERNAL FUNCTION NEEDED FOR NON-PROPORTIONAL HAZARDS MODELS.
### Aliases: nph

### ** Examples

# Examine the tongue data set (from the KMest package), and
# quantify how the rumor DNA profile (1=Aneuploid Tumor, 2=Diploid Tumor)
# affects survival time (in weeks).
data(tongue)

# Fit the MRH model, including tumor type using the 
# non-proportional hazards model.  
# With 16 bins (M = 4), each bin represents 25 weeks.
# Generally it is recommended to use a higher burn-in value, 
# thinning value, and maximum number
# of iterations, but for illustrative purposes these values 
# have been lowered.
## Not run: 
##D fit.tongue = estimateMRH(formula = Surv(time, delta) ~ 
##D 	nph(type), data = tongue, M = 4, 
##D 	burnIn = 200, maxIter = 2000, thin = 1, 
##D 	outfolder = 'MRH_tongue_nph')
## End(Not run)



