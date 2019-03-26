library(beautier)


### Name: is_tree_prior
### Title: Determine if an object is a valid tree prior
### Aliases: is_tree_prior

### ** Examples

  testit::assert(is_tree_prior(create_bd_tree_prior()))
  testit::assert(is_tree_prior(create_yule_tree_prior()))
  testit::assert(!is_tree_prior("nonsense"))



