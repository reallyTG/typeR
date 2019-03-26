library(beautier)


### Name: check_clock_model
### Title: Check if the clock model is a valid clock model.
### Aliases: check_clock_model

### ** Examples

 testthat::expect_silent(check_clock_model(create_strict_clock_model()))
 testthat::expect_silent(check_clock_model(create_rln_clock_model()))

 # Must stop on non-clock models
 testthat::expect_error(check_clock_model(clock_model = "nonsense"))
 testthat::expect_error(check_clock_model(clock_model = NULL))
 testthat::expect_error(check_clock_model(clock_model = NA))



