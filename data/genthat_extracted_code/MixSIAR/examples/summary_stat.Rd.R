library(MixSIAR)


### Name: summary_stat
### Title: Summary statistics from posterior of MixSIAR model
### Aliases: summary_stat

### ** Examples

## Not run: 
##D # first run mantis shrimp example
##D # combine 6 sources into 2 groups of interest (hard-shelled vs. soft-bodied)
##D #   'hard' = 'clam' + 'crab' + 'snail'           # group 1 = hard-shelled prey
##D #   'soft' = 'alphworm' + 'brittlestar' + 'fish' # group 2 = soft-bodied prey
##D combined <- combine_sources(jags.1, mix, source, alpha.prior=alpha, 
##D                 groups=list(hard=c("clam","crab","snail"), soft=c("alphworm","brittlestar","fish")))
##D 
##D summary_stat(combined)
##D summary_stat(combined, savetxt=FALSE)
##D summary_stat(combined, meanSD=FALSE)
##D summary_stat(combined, quantiles=c(.05,.5,.95))
##D summary_stat(combined, toprint="fac1")
##D summary_stat(combined, toprint="p")
##D summary_stat(combined, toprint="global")
## End(Not run)



