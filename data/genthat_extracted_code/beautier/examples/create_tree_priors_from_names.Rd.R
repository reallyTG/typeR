library(beautier)


### Name: create_tree_priors_from_names
### Title: Create tree priors from their names
### Aliases: create_tree_priors_from_names

### ** Examples

  names <- get_tree_prior_names()
  tree_priors <- create_tree_priors_from_names(names)

  for (i in seq_along(names)) {
    testthat::expect_equal(names[i], tree_priors[[i]]$name)
  }



