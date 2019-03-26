library(beautier)


### Name: create_tree_priors
### Title: Creates all supported tree priors, which is a list of the types
###   returned by 'create_bd_tree_prior', 'create_cbs_tree_prior',
###   'create_ccp_tree_prior', 'create_cep_tree_prior' and
###   'create_yule_tree_prior'
### Aliases: create_tree_priors

### ** Examples

  tree_priors <- create_tree_priors()
  testit::assert(beautier:::is_bd_tree_prior(tree_priors[[1]]))
  testit::assert(beautier:::is_cbs_tree_prior(tree_priors[[2]]))
  testit::assert(beautier:::is_ccp_tree_prior(tree_priors[[3]]))
  testit::assert(beautier:::is_cep_tree_prior(tree_priors[[4]]))
  testit::assert(beautier:::is_yule_tree_prior(tree_priors[[5]]))



