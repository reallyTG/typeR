library(MixSIAR)


### Name: plot_intervals
### Title: Plot posterior uncertainty intervals from a MixSIAR model
### Aliases: plot_intervals

### ** Examples

## Not run: 
##D # 1. run mantis shrimp example
##D original <- combine_sources(jags.1, mix, source, alpha, 
##D                 groups=list(alphworm="alphworm",brittlestar="brittlestar",clam="clam",
##D                            crab="crab",fish="fish",snail="snail"))
##D # 2. combine 6 sources into 2 groups of interest (hard-shelled vs. soft-bodied)
##D #   'hard' = 'clam' + 'crab' + 'snail'           # group 1 = hard-shelled prey
##D #   'soft' = 'alphworm' + 'brittlestar' + 'fish' # group 2 = soft-bodied prey
##D combined <- combine_sources(jags.1, mix, source, alpha.prior=alpha, 
##D                 groups=list(hard=c("clam","crab","snail"), soft=c("alphworm","brittlestar","fish")))
##D 
##D plot_intervals(combined,toplot="fac1")
##D plot_intervals(original,toplot="fac1")
##D plot_intervals(combined,toplot="fac1",levels=1)
##D plot_intervals(combined,toplot="fac1",levels=2)
##D 
## End(Not run)



