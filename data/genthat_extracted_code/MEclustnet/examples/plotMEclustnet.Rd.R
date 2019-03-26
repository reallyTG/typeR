library(MEclustnet)


### Name: plotMEclustnet
### Title: Plot latent position network.
### Aliases: plotMEclustnet
### Keywords: plot

### ** Examples

#################################################################
# An example analysing a 2016 Twitter network of US politicians.
#################################################################
# Number of iterations etc. are set to low values for illustrative purposes.
# Longer run times are likely to be required to achieve sufficient mixing.

library(latentnet)
data(us.twitter.adjacency)
data(us.twitter.covariates)

link.vars = c(1)
mix.vars = c(1,5,7,8)

## Not run: 
##D fit = MEclustnet(us.twitter.adjacency, us.twitter.covariates,
##D link.vars, mix.vars, G=4, d=2, itermax = 500, burnin = 50, uphill = 1, thin=10)
##D 
##D # Plot the trace plot of the mean of dimension 1 for each cluster.
##D matplot(t(fit$mustore[,1,]), type="l", xlab="Iteration", ylab="Parameter")
##D 
##D # Compute posterior summaries
##D summ = summaryMEclustnet(fit, us.twitter.adjacency)
##D 
##D plot(summ$zmean, col=summ$Kmode, xlab="Dimension 1", ylab="Dimension 2", pch=summ$Kmode, 
##D main = "Posterior mean latent location for each node.")
##D 
##D # Plot the resulting latent space, with uncertainties
##D plotMEclustnet(fit, us.twitter.adjacency, link.vars, mix.vars)
##D 
##D # Examine which politicians are in which clusters...
##D clusters = list()
##D for(g in 1:fit$G)
##D {
##D   clusters[[g]] = us.twitter.covariates[summ$Kmode==g,c("name", "party")]
##D }
##D clusters
## End(Not run)



