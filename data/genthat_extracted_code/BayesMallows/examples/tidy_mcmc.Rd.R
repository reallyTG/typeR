library(BayesMallows)


### Name: tidy_mcmc
### Title: Internal Function for Tidying MCMC Output
### Aliases: tidy_mcmc
### Keywords: internal

### ** Examples

# If interest only lies in finding the right number of clusters, and the
# dataset is very large, it may be useful to skip the postprocessing. We
# demonstrate it here with the example dataset potato_visual (which is not
# large).
# Use the map function from purrr to compute a model for each number of clusters
models <- compute_mallows_mixtures(n_clusters = 1:10, rankings = potato_visual,
                                   include_wcd = TRUE, save_clus = TRUE,
                                   skip_postprocessing = TRUE)

# Let us look at the within-cluster distances for one of the models
# In this case, it is a 5 times 2000 matrix with the values from MCMC,
# and in general it is n_clusters x nmc.
str(models[[5]]$within_cluster_distance)

# Since we skipped postprocessing, the following will fail:
## Not run: 
##D   plot_elbow(models, burnin = 500)
##D 
##D   # We now tidy the within-cluster distances, which is what is used by
##D   # plot_elbow
##D   library(dplyr)
##D   library(tidyr)
##D   library(purrr)
##D   tidy_models <- models %>%
##D     map(~ tidy_mcmc(.x,
##D                     tidy_rho = FALSE,
##D                     tidy_alpha = FALSE,
##D                     tidy_cluster_assignment = FALSE,
##D                     tidy_cluster_probabilities = FALSE,
##D                     tidy_wcd = TRUE,
##D                     tidy_augmented_data = TRUE,
##D                     tidy_augmentation_acceptance = TRUE)
##D         )
##D 
##D   # Let us again look at the within-cluster distances
##D   # It is a dataframe in "tidy" format.
##D   str(tidy_models[[5]]$within_cluster_distance)
##D   tidy_models[[5]]$within_cluster_distance
##D 
##D   # We can now call plot_elbow
##D   plot_elbow(tidy_models, burnin = 500)
## End(Not run)



