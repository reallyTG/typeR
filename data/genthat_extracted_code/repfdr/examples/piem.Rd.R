library(repfdr)


### Name: piem
### Title: Estimation of the prior probabilities for each association
###   status vector.
### Aliases: piem Pi

### ** Examples

## Not run: 
##D 
##D download.file('http://www.math.tau.ac.il/~ruheller/repfdr_RData/binned_zmat.RData',
##D   destfile = "binned_zmat.RData")
##D load(file = "binned_zmat.RData")
##D #binned_zmat can also be generated via 
##D output_piem <- piem(pbz, bz)
##D 
##D # extract the last iteration to use it in repfdr (see help(repfdr)):
##D Pi1 <- output_piem$last.iteration
##D data(Pi)
##D stopifnot(all.equal(Pi,Pi1))
##D 
##D # simulation data:
##D data(binned_zmat_sim)
##D output_piem_sim <- piem(pbz_sim, bz_sim)
##D Pi_sim <- output_piem_sim$last.iteration
##D 
##D # following are the true proportions in the data: (see help(hmat_sim) for data generation details.)
##D f <- c(0.895,0.005,0.005,0.02,0.005,0.02,0.02,0.03) 
##D 
##D # the estimation vs the true proportions:
##D cbind(round(Pi_sim,6),f)
## End(Not run)



