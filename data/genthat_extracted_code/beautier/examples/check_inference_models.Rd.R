library(beautier)


### Name: check_inference_models
### Title: Check if the 'inference_model' is a valid BEAUti inference
###   model.
### Aliases: check_inference_models

### ** Examples

 testthat::expect_silent(
   check_inference_models(
       list(create_inference_model()
     )
   )
 )

 # Must stop on nonsense
 testthat::expect_error(check_inference_models("nonsense"))
 testthat::expect_error(check_inference_models(NULL))
 testthat::expect_error(check_inference_models(NA))



