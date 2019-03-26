library(psychmeta)


### Name: impute_artifacts
### Title: Impute missing and impossible artifact values
### Aliases: impute_artifacts
### Keywords: internal

### ** Examples

# art_vec <- c(.6, .7, NA, .8, .9, NA)
# cat_moderator_matrix <- matrix(c(rep(1, 3), rep(2, 3)))
# art_type <- "rel"
# n_vec <- c(50, 200, 100, 50, 200, 100)
#
# ## Compute unweighted means
# impute_artifacts(art_vec = art_vec, cat_moderator_matrix = cat_moderator_matrix,
#                 impute_method = "unwt_mean_full", art_type = art_type, n_vec = n_vec)
# impute_artifacts(art_vec = art_vec, cat_moderator_matrix = cat_moderator_matrix,
#                 impute_method = "unwt_mean_mod", art_type = art_type, n_vec = n_vec)
#
# ## Compute weighted means
# impute_artifacts(art_vec = art_vec, cat_moderator_matrix = cat_moderator_matrix,
#                 impute_method = "wt_mean_full", art_type = art_type, n_vec = n_vec)
# impute_artifacts(art_vec = art_vec, cat_moderator_matrix = cat_moderator_matrix,
#                 impute_method = "wt_mean_mod", art_type = art_type, n_vec = n_vec)
#
# ## Simulate from distribution with the mean and variance of the observed artifacts
# impute_artifacts(art_vec = art_vec, cat_moderator_matrix = cat_moderator_matrix,
#                 impute_method = "simulate_full", art_type = art_type, n_vec = n_vec)
# impute_artifacts(art_vec = art_vec, cat_moderator_matrix = cat_moderator_matrix,
#                 impute_method = "simulate_mod", art_type = art_type, n_vec = n_vec)
#
# ## Sample random values from the observed distribution of artifacts
# impute_artifacts(art_vec = art_vec, cat_moderator_matrix = cat_moderator_matrix,
#                 impute_method = "bootstrap_mod", art_type = art_type, n_vec = n_vec)
# impute_artifacts(art_vec = art_vec, cat_moderator_matrix = cat_moderator_matrix,
#                 impute_method = "bootstrap_full", art_type = art_type, n_vec = n_vec)
#
# ## If all values are missing from a moderator category, the program will run
# ## full-data imputation on the remaining missing values:
# impute_artifacts(art_vec = c(NA, NA, NA, .7, .8, .9), cat_moderator_matrix = cat_moderator_matrix,
#                 impute_method = "bootstrap_mod", art_type = art_type, n_vec = n_vec)



