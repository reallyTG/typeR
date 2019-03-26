library(beautier)


### Name: are_tree_priors
### Title: Determine if x consists out of tree_priors objects
### Aliases: are_tree_priors

### ** Examples

  yule_tree_prior <- create_yule_tree_prior()
  bd_tree_prior <- create_bd_tree_prior()
  both_tree_priors <- list(yule_tree_prior, bd_tree_prior)
  testit::assert(are_tree_priors(yule_tree_prior))
  testit::assert(are_tree_priors(bd_tree_prior))
  testit::assert(are_tree_priors(both_tree_priors))



