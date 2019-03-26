library(beautier)


### Name: check_inference_model
### Title: Check if the supplied object is a valid Bayesian phylogenetic
###   inference model.
### Aliases: check_inference_model

### ** Examples

 testthat::expect_silent(check_inference_model(create_inference_model()))

 # Must stop on non-MCMCs
 testthat::expect_error(check_inference_model(inference_model = "nonsense"))
 testthat::expect_error(check_inference_model(inference_model = NULL))
 testthat::expect_error(check_inference_model(inference_model = NA))



