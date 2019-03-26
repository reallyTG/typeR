library(nLTT)


### Name: abc_smc_nltt
### Title: A function to perform Approximate Bayesian Computation within a
###   Sequential Markov Chain (ABC-SMC), for diversification analysis of
###   phylogenetic trees.
### Aliases: abc_smc_nltt

### ** Examples

  ## Not run: 
##D 
##D   prior_gen <- function() {
##D     return( rexp(n=2, rate=0.1) )
##D   }
##D 
##D   prior_dens <- function(val) {
##D     return( dexp( val[1], rate = 0.1) * dexp( val[2], rate = 0.1) )
##D   }
##D 
##D   require(TESS)
##D 
##D   treeSim <- function(params) {
##D     t <- TESS.sim.age(n=1, lambda = params[1], mu = params[2], age = 10)[[1]]
##D     return(t)
##D   }
##D 
##D   obs <- treeSim(c(0.5,0.1))
##D 
##D   statWrapper <- function(tree1) {
##D     return( nLTTstat_exact(tree1, obs, "abs"))
##D   }
##D 
##D   stats <- c(statWrapper)
##D 
##D   results <-  abc.smc.nltt(
##D     obs, stats, treeSim, init_epsilon_values = 0.2,
##D     prior_generating_function = prior_gen,
##D     prior_density_function = prior_dens,
##D     number_of_particles = 1000, sigma = 0.05, stop_rate = 1e-5
##D   )
##D 
##D   
## End(Not run) # end of dontrun



