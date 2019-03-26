library(beautier)


### Name: check_tree_priors
### Title: Check if the object is a list of one or more tree priors.
### Aliases: check_tree_priors

### ** Examples

  testthat::expect_silent(check_tree_priors(create_yule_tree_prior()))
  testthat::expect_silent(check_tree_priors(list(create_yule_tree_prior())))
  testthat::expect_silent(
    check_tree_priors(
      list(create_yule_tree_prior(), create_bd_tree_prior())
    )
  )

  testthat::expect_error(check_tree_priors("nonsense"))
  testthat::expect_error(check_tree_priors(3.14))
  testthat::expect_error(check_tree_priors(42))
  testthat::expect_error(check_tree_priors(NA))
  testthat::expect_error(check_tree_priors(NULL))



