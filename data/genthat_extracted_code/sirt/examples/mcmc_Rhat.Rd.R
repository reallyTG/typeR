library(sirt)


### Name: mcmc_Rhat
### Title: Computation of the Rhat Statistic from a Single MCMC Chain
### Aliases: mcmc_Rhat

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Computation Rhat statistic for 2PNO model fitting by MCMC
##D #############################################################################
##D 
##D data(data.read)
##D 
##D # estimate 2PNO with MCMC with 3000 iterations and 500 burn-in iterations
##D mod <- sirt::mcmc.2pno( dat=data.read, iter=1000, burnin=100 )
##D # plot MCMC chains
##D plot( mod$mcmcobj, ask=TRUE )
##D # compute Rhat statistics
##D round( sirt::mcmc_Rhat( mod$mcmcobj[[1]] ), 3 )
## End(Not run)



