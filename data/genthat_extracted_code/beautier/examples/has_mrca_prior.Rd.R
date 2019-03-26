library(beautier)


### Name: has_mrca_prior
### Title: Determines if the inference model has an MRCA prior.
### Aliases: has_mrca_prior

### ** Examples

  # No MRCA prior
  inference_model <- create_inference_model(
    mrca_prior = NA
  )
  testthat::expect_false(has_mrca_prior(inference_model))

  # A default MRCA prior
  inference_model <- create_inference_model(
    mrca_prior = create_mrca_prior()
  )
  testthat::expect_true(has_mrca_prior(inference_model))



