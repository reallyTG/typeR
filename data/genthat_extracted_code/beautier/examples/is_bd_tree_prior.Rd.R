library(beautier)


### Name: is_bd_tree_prior
### Title: Determine if the object is a valid Birth Death tree prior
### Aliases: is_bd_tree_prior

### ** Examples

  testit::assert(is_bd_tree_prior(create_bd_tree_prior()))
  testit::assert(!is_bd_tree_prior(create_cbs_tree_prior()))
  testit::assert(!is_bd_tree_prior(create_ccp_tree_prior()))
  testit::assert(!is_bd_tree_prior(create_cep_tree_prior()))
  testit::assert(!is_bd_tree_prior(create_yule_tree_prior()))



