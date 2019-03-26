library(MixSIAR)


### Name: combine_sources
### Title: Combine sources from a finished MixSIAR model (_a posteriori_)
### Aliases: combine_sources

### ** Examples

## Not run: 
##D # first run mantis shrimp example
##D # combine 6 sources into 2 groups of interest (hard-shelled vs. soft-bodied)
##D #   'hard' = 'clam' + 'crab' + 'snail'           # group 1 = hard-shelled prey
##D #   'soft' = 'alphworm' + 'brittlestar' + 'fish' # group 2 = soft-bodied prey
##D combined <- combine_sources(jags.1, mix, source, alpha.prior=alpha, 
##D                 groups=list(hard=c("clam","crab","snail"), soft=c("alphworm","brittlestar","fish")))
##D 
##D # get posterior medians for new source groupings
##D apply(combined$post, 2, median)
##D summary_stat(combined, meanSD=FALSE, quantiles=c(.025,.5,.975), savetxt=FALSE)
## End(Not run)




