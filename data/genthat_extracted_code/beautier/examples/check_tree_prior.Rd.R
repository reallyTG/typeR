library(beautier)


### Name: check_tree_prior
### Title: Check if the tree prior is a valid tree prior
### Aliases: check_tree_prior

### ** Examples

 testthat::expect_silent(check_tree_prior(create_yule_tree_prior()))
 testthat::expect_silent(check_tree_prior(create_bd_tree_prior()))
 testthat::expect_silent(check_tree_prior(create_cbs_tree_prior()))
 testthat::expect_silent(check_tree_prior(create_ccp_tree_prior()))
 testthat::expect_silent(check_tree_prior(create_cep_tree_prior()))

 # Can use list of one tree prior
 testthat::expect_silent(check_tree_prior(list(create_yule_tree_prior())))

 # List of two tree priors is not a/one tree prior
 testthat::expect_error(
   check_tree_prior(
     list(create_yule_tree_prior(), create_yule_tree_prior())
   )
 )

 # Must stop on non-tree priors
 testthat::expect_error(check_tree_prior(tree_prior = "nonsense"))
 testthat::expect_error(check_tree_prior(tree_prior = NULL))
 testthat::expect_error(check_tree_prior(tree_prior = NA))



