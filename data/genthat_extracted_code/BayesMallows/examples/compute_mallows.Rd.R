library(BayesMallows)


### Name: compute_mallows
### Title: Preference Learning with the Mallows Rank Model
### Aliases: compute_mallows

### ** Examples

# ANALYSIS OF COMPLETE RANKINGS
# The example datasets potato_visual and potato_weighing contain complete
# rankings of 20 items, by 12 assessors. We first analyse these using the Mallows
# model:
model_fit <- compute_mallows(potato_visual)

# We study the trace plot of the parameters
assess_convergence(model_fit, parameter = "alpha")
## Not run: assess_convergence(model_fit, parameter = "rho")

# Based on these plots, we set burnin = 1000.
model_fit$burnin <- 1000
# Next, we use the generic plot function to study the posterior distributions
# of alpha and rho
plot(model_fit, parameter = "alpha")
## Not run: plot(model_fit, parameter = "rho", items = 10:15)

# We can also compute the CP consensus posterior ranking
compute_consensus(model_fit, type = "CP")

# And we can compute the posterior intervals:
# First we compute the interval for alpha
compute_posterior_intervals(model_fit, parameter = "alpha")
# Then we compute the interval for all the items
## Not run: compute_posterior_intervals(model_fit, parameter = "rho")

# ANALYSIS OF PAIRWISE PREFERENCES
## Not run: 
##D   # The example dataset beach_preferences contains pairwise
##D   # preferences between beaches stated by 60 assessors. There
##D   # is a total of 15 beaches in the dataset.
##D   # In order to use it, we first generate all the orderings
##D   # implied by the pairwise preferences.
##D   beach_tc <- generate_transitive_closure(beach_preferences)
##D   # We also generate an inital rankings
##D   beach_rankings <- generate_initial_ranking(beach_tc, n_items = 15)
##D   # We then run the Bayesian Mallows rank model
##D   # We save the augmented data for diagnostics purposes.
##D   model_fit <- compute_mallows(rankings = beach_rankings,
##D                                preferences = beach_tc,
##D                                save_aug = TRUE,
##D                                verbose = TRUE)
##D   # We can assess the convergence of the scale parameter
##D   assess_convergence(model_fit)
##D   # We can assess the convergence of latent rankings. Here we
##D   # show beaches 1-5.
##D   assess_convergence(model_fit, parameter = "rho", items = 1:5)
##D   # We can also look at the convergence of the augmented rankings for
##D   # each assessor.
##D   assess_convergence(model_fit, parameter = "Rtilde",
##D                      items = c(2, 4), assessors = c(1, 2))
##D   # Notice how, for assessor 1, the lines cross each other, while
##D   # beach 2 consistently has a higher rank value (lower preference) for
##D   # assessor 2. We can see why by looking at the implied orderings in
##D   # beach_tc
##D   library(dplyr)
##D   beach_tc %>%
##D     filter(assessor %in% c(1, 2),
##D            bottom_item %in% c(2, 4) & top_item %in% c(2, 4))
##D   # Assessor 1 has no implied ordering between beach 2 and beach 4,
##D   # while assessor 2 has the implied ordering that beach 4 is preferred
##D   # to beach 2. This is reflected in the trace plots.
## End(Not run)

# CLUSTERING OF ASSESSORS WITH SIMILAR PREFERENCES
## Not run: 
##D   # The example dataset sushi_rankings contains 5000 complete
##D   # rankings of 10 types of sushi
##D   # We start with computing a 3-cluster solution, and save
##D   # cluster assignments by setting save_clus = TRUE
##D   model_fit <- compute_mallows(sushi_rankings, n_clusters = 3,
##D                                nmc = 10000, save_clus = TRUE, verbose = TRUE)
##D   # We then assess convergence of the scale parameter alpha
##D   assess_convergence(model_fit)
##D   # Next, we assess convergence of the cluster probabilities
##D   assess_convergence(model_fit, parameter = "cluster_probs")
##D   # Based on this, we set burnin = 1000
##D   # We now plot the posterior density of the scale parameters alpha in
##D   # each mixture:
##D   model_fit$burnin <- 1000
##D   plot(model_fit, parameter = "alpha")
##D   # We can also compute the posterior density of the cluster probabilities
##D   plot(model_fit, parameter = "cluster_probs")
##D   # We can also plot the posterior cluster assignment. In this case,
##D   # the assessors are sorted according to their maximum a posteriori cluster estimate.
##D   plot(model_fit, parameter = "cluster_assignment")
##D   # We can also assign each assessor to a cluster
##D   cluster_assignments <- assign_cluster(model_fit, soft = FALSE)
##D   
## End(Not run)

# DETERMINING THE NUMBER OF CLUSTERS
## Not run: 
##D   # Continuing with the sushi data, we can determine the number of cluster
##D   # Let us look at any number of clusters from 1 to 10
##D   # We use the convenience function compute_mallows_mixtures
##D   n_clusters <- seq(from = 1, to = 10)
##D   models <- compute_mallows_mixtures(n_clusters = n_clusters, rankings = sushi_rankings,
##D                                      nmc = 6000, alpha_jump = 10, include_wcd = TRUE)
##D   # models is a list in which each element is an object of class BayesMallows,
##D   # returned from compute_mallows
##D   # We can create an elbow plot
##D   plot_elbow(models, burnin = 1000)
##D   # We then select the number of cluster at a point where this plot has
##D   # an "elbow", e.g., at 6 clusters.
## End(Not run)




