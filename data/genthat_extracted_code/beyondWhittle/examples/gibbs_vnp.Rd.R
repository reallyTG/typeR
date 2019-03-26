library(beyondWhittle)


### Name: gibbs_vnp
### Title: Gibbs sampler for multivaiate Bayesian nonparametric inference
###   with Whittle likelihood
### Aliases: gibbs_vnp

### ** Examples

## Not run: 
##D 
##D ##
##D ## Example: Fit multivariate NP model to SOI/Recruitment series:
##D ##
##D 
##D data <- cbind(as.numeric(astsa::soi-mean(astsa::soi)), 
##D               as.numeric(astsa::rec-mean(astsa::rec)) / 50)
##D data <- apply(data, 2, function(x) x-mean(x))
##D 
##D # If you run the example be aware that this may take several minutes
##D print("example may take some time to run")
##D mcmc <- gibbs_vnp(data=data, Ntotal=10000, burnin=4000, thin=2)
##D 
##D # Visualize results
##D plot(mcmc, log=T)
##D 
##D 
##D ##
##D ## Example 2: Fit multivariate NP model to VMA(1) data
##D ##
##D 
##D n <- 256
##D ma <- rbind(c(-0.75, 0.5), c(0.5, 0.75))
##D Sigma <- rbind(c(1, 0.5), c(0.5, 1))
##D data <- sim_varma(model=list(ma=ma), n=n, d=2)
##D data <- apply(data, 2, function(x) x-mean(x))
##D 
##D # If you run the example be aware that this may take several minutes
##D print("example may take some time to run")
##D mcmc <- gibbs_vnp(data=data, Ntotal=10000, burnin=4000, thin=2)
##D 
##D # Plot spectral estimate, credible regions and periodogram on log-scale
##D plot(mcmc, log=T)
## End(Not run)



