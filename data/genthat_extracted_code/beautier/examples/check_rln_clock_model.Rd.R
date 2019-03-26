library(beautier)


### Name: check_rln_clock_model
### Title: Check if the clock model is a valid clock model.
### Aliases: check_rln_clock_model

### ** Examples

 testthat::expect_silent(
   check_rln_clock_model(create_rln_clock_model())
 )
 testthat::expect_error(
   check_rln_clock_model(create_strict_clock_model())
 )



