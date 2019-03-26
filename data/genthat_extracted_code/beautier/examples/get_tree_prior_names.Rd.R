library(beautier)


### Name: get_tree_prior_names
### Title: Get the tree prior names
### Aliases: get_tree_prior_names

### ** Examples

  names <- beautier:::get_tree_prior_names()
  testit::assert("birth_death" %in% names)
  testit::assert("coalescent_bayesian_skyline" %in% names)
  testit::assert("coalescent_constant_population" %in% names)
  testit::assert("coalescent_exp_population" %in% names)
  testit::assert("yule" %in% names)



