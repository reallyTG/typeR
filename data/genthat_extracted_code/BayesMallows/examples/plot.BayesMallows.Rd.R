library(BayesMallows)


### Name: plot.BayesMallows
### Title: Plot Posterior Distributions
### Aliases: plot.BayesMallows

### ** Examples

# The example datasets potato_visual and potato_weighing contain complete
# rankings of 20 items, by 12 assessors. We first analyse these using the Mallows
# model:
model_fit <- compute_mallows(potato_visual)

# Se the documentation to compute_mallows for how to assess the convergence
# of the algorithm
# We set the burnin = 1000
model_fit$burnin <- 1000
# By default, the scale parameter "alpha" is plotted
plot(model_fit)
## Not run: 
##D   # We can also plot the latent rankings "rho"
##D   plot(model_fit, parameter = "rho")
##D   # By default, a random subset of 5 items are plotted
##D   # Specify which items to plot in the items argument.
##D   plot(model_fit, parameter = "rho",
##D        items = c(2, 4, 6, 9, 10, 20))
##D   # When the ranking matrix has column names, we can also
##D   # specify these in the items argument.
##D   # In this case, we have the following names:
##D   colnames(potato_visual)
##D   # We can therefore get the same plot with the following call:
##D   plot(model_fit, parameter = "rho",
##D        items = c("P2", "P4", "P6", "P9", "P10", "P20"))
##D   
## End(Not run)

## Not run: 
##D   # Plots of mixture parameters:
##D   # We can run a mixture of Mallows models, using the n_clusters argument
##D   # We use the sushi example data. See the documentation of compute_mallows for a more elaborate
##D   # example
##D   model_fit <- compute_mallows(sushi_rankings, n_clusters = 5, save_clus = TRUE)
##D   model_fit$burnin <- 1000
##D   # We can then plot the posterior distributions of the cluster probabilities
##D   plot(model_fit, parameter = "cluster_probs")
##D   # We can also get a cluster assignment plot, showing the assessors along the horizontal
##D   # axis and the clusters along the vertical axis. The color show the probability
##D   # of belonging to each clusters. The assessors are sorted along the horizontal
##D   # axis according to their maximum a posterior cluster assignment. This plot
##D   # illustrates the posterior uncertainty in cluster assignments.
##D   plot(model_fit, parameter = "cluster_assignment")
##D   # See also ?assign_cluster for a function which returns the cluster assignment
##D   # back in a dataframe.
## End(Not run)







