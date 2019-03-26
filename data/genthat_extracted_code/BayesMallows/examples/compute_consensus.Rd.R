library(BayesMallows)


### Name: compute_consensus
### Title: Compute Consensus Ranking
### Aliases: compute_consensus

### ** Examples

# The example datasets potato_visual and potato_weighing contain complete
# rankings of 20 items, by 12 assessors. We first analyse these using the Mallows
# model:
model_fit <- compute_mallows(potato_visual)

# Se the documentation to compute_mallows for how to assess the convergence of the algorithm
# Having chosen burin = 1000, we compute posterior intervals
model_fit$burnin <- 1000
# We then compute the CP consensus.
compute_consensus(model_fit, type = "CP")
# And we compute the MAP consensus
compute_consensus(model_fit, type = "MAP")

## Not run: 
##D   # CLUSTERWISE CONSENSUS
##D   # We can run a mixture of Mallows models, using the n_clusters argument
##D   # We use the sushi example data. See the documentation of compute_mallows for a more elaborate
##D   # example
##D   model_fit <- compute_mallows(sushi_rankings, n_clusters = 5)
##D   # Keeping the burnin at 1000, we can compute the consensus ranking per cluster
##D   model_fit$burnin <- 1000
##D   cp_consensus_df <- compute_consensus(model_fit, type = "CP")
##D   # Using dplyr::select and tidyr::cumprob we can now make a table
##D   # which shows the ranking in each cluster:
##D   library(dplyr)
##D   library(tidyr)
##D   cp_consensus_df %>%
##D     select(-cumprob) %>%
##D     spread(key = cluster, value = item)
## End(Not run)

## Not run: 
##D   # MAP CONSENSUS FOR PAIRWISE PREFENCE DATA
##D   # We use the example dataset with beach preferences.
##D   model_fit <- compute_mallows(preferences = beach_preferences)
##D   # We set burnin = 1000
##D   model_fit$burnin <- 1000
##D   # We now compute the MAP consensus
##D   map_consensus_df <- compute_consensus(model_fit, type = "MAP")
## End(Not run)



