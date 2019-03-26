library(tscount)


### Name: interv_multiple.tsglm
### Title: Detecting Multiple Interventions in Count Time Series Following
###   Generalised Linear Models
### Aliases: interv_multiple.tsglm interv_multiple
### Keywords: Intervention detection

### ** Examples

## Not run: 
##D ###Campylobacter infections in Canada (see help("campy"))
##D #Searching for potential intervention effects (runs several hours!):
##D campyfit <- tsglm(ts=campy, model=list(past_obs=1, past_mean=c(7,13)))
##D campyfit_intervmultiple <- interv_multiple(fit=campyfit, taus=80:120,
##D                               deltas=c(0,0.8,1), B=500, signif_level=0.05)
##D campyfit_intervmultiple
##D plot(campyfir_intervmultiple)
##D #Parallel computation for shorter run time on a cluster:
##D library(parallel)
##D ntasks <- 3
##D clust <- makeCluster(ntasks)
##D setDefaultCluster(cl=clust)
##D interv_multiple(fit=campyfit, taus=80:120, deltas=c(0,0.8,1), B=500,
##D                 signif_level=0.05, parallel=TRUE)
## End(Not run)



