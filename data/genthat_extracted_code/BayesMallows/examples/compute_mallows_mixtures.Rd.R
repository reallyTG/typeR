library(BayesMallows)


### Name: compute_mallows_mixtures
### Title: Compute Mixtures of Mallows Models
### Aliases: compute_mallows_mixtures

### ** Examples

# DETERMINING THE NUMBER OF CLUSTERS IN THE SUSHI EXAMPLE DATA
## Not run: 
##D   # Let us look at any number of clusters from 1 to 10
##D   # We use the convenience function compute_mallows_mixtures
##D   n_clusters <- seq(from = 1, to = 10)
##D   models <- compute_mallows_mixtures(n_clusters = n_clusters,
##D                                      rankings = sushi_rankings,
##D                                      include_wcd = TRUE)
##D   # models is a list in which each element is an object of class BayesMallows,
##D   # returned from compute_mallows
##D   # We can create an elbow plot
##D   plot_elbow(models, burnin = 1000)
##D   # We then select the number of cluster at a point where this plot has
##D   # an "elbow", e.g., n_clusters = 5.
##D 
##D   # Having chosen the number of clusters, we can now study the final model
##D   # Rerun with 5 clusters, now setting save_clus = TRUE to get cluster assignments
##D   mixture_model <- compute_mallows(rankings = sushi_rankings, n_clusters = 5,
##D                                    include_wcd = TRUE, save_clus = TRUE)
##D   # Delete the models object to free some memory
##D   rm(models)
##D   # Set the burnin
##D   mixture_model$burnin <- 1000
##D   # Plot the posterior distributions of alpha per cluster
##D   plot(mixture_model)
##D   # Compute the posterior interval of alpha per cluster
##D   compute_posterior_intervals(mixture_model,
##D                               parameter = "alpha")
##D   # Plot the posterior distributions of cluster probabilities
##D   plot(mixture_model, parameter = "cluster_probs")
##D   # Plot the posterior probability of cluster assignment
##D   plot(mixture_model, parameter = "cluster_assignment")
##D   # Plot the posterior distribution of "tuna roll" in each cluster
##D   plot(mixture_model, parameter = "rho", items = "tuna roll")
##D   # Compute the cluster-wise CP consensus, and show one column per cluster
##D   cp <- compute_consensus(mixture_model, type = "CP")
##D   library(dplyr)
##D   library(tidyr)
##D   cp %>%
##D     select(-cumprob) %>%
##D     spread(key = cluster, value = item)
##D   # Compute the MAP consensus, and show one column per cluster
##D   map <- compute_consensus(mixture_model, type = "MAP")
##D   map %>%
##D     select(-probability) %>%
##D     spread(key = cluster, value = item)
## End(Not run)






