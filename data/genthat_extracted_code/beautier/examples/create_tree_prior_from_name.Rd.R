library(beautier)


### Name: create_tree_prior_from_name
### Title: Create a tree prior from name
### Aliases: create_tree_prior_from_name

### ** Examples

  tree_prior_names <- get_tree_prior_names()
  for (tree_prior_name in tree_prior_names) {
    tree_prior <- create_tree_prior_from_name(tree_prior_name)
    testthat::expect_equal(tree_prior_name, tree_prior$name)
  }



