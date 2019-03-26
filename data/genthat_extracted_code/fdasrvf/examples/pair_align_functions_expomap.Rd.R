library(fdasrvf)


### Name: pair_align_functions_expomap
### Title: Align two functions using geometric properties of warping
###   functions
### Aliases: pair_align_functions_expomap

### ** Examples

## Not run: 
##D # This is a mcmc algorithm and takes a long time to run
##D data("simu_data")
##D myzpcn <- list(betas = c(0.1, 0.01, 0.005, 0.0001),
##D   probs = c(0.2, 0.2, 0.4, 0.2))
##D out = pair_align_functions_expomap(simu_data$f[,1], simu_data$f[,2],
##D   timet = simu_data$time, zpcn = myzpcn, extrainfo = TRUE)
##D # overall acceptance ratio
##D mean(out$accept)
##D # acceptance ratio by zpcn coefficient
##D with(out, tapply(accept, myzpcn$betas[betas.ind], mean))
## End(Not run)



