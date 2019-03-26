library(MRH)


### Name: MRH
### Title: Converts an MRH MCMC chains text file into an MRH object
### Aliases: MRH MRH.default as.MRH is.MRH

### ** Examples

# The MRH fit example is from the estimateMRH() help page.  It does not need to 
# be re-run if the code has previously been run and the outfolder ('MRH_tongue_nph') is
# saved.
data(tongue)
## Not run: 
##D fit.tongue = estimateMRH(formula = Surv(time, delta) ~ nph(type), data = tongue, M = 4, 
##D 	burnIn = 200, maxIter = 2000, thin = 1, outfolder = 'MRH_tongue_nph')
## End(Not run)

## Not run: 
##D MRHchains = read.table('MRH_tongue_nph/MCMCchains.txt', header = TRUE)
##D MRHobject = MRH(MRHchains)
##D # When the chains are read in, the maximum study time must
##D # be entered in the summary function, and the total number
##D # of subjects (n) must be entered for BIC to be calculated.
##D summary(MRHobject, maxStudyTime = max(tongue$time))
##D DIC(MRHobject, n = nrow(tongue))
## End(Not run)



