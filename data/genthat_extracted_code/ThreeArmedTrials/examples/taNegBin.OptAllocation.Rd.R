library(ThreeArmedTrials)


### Name: taNegBin.OptAllocation
### Title: Optimal sample size for three-armed clinical trials with
###   negative binomial distributed endpoints
### Aliases: taNegBin.OptAllocation
### Keywords: NegativeBinomial optimalSampleSizeAllocation

### ** Examples

# Example for type = 'unrestricted'
taNegBin.OptAllocation(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
 type = 'unrestricted', n = 1048, sig.level = 0.025)
taNegBin.OptAllocation(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
 type = 'unrestricted')

# Example for type = 'restricted'.
## Not run: 
##D taNegBin.OptAllocation(rateExp = 2, rateRef = 2, ratePla = 4, shape = 0.5, Delta = 0.8,
##D  type = 'restricted', n = 500, sig.level = 0.025)
## End(Not run)



