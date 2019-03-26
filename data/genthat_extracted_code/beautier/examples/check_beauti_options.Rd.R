library(beautier)


### Name: check_beauti_options
### Title: Check if the 'beauti_options' is a valid 'beauti_options'
###   object.
### Aliases: check_beauti_options

### ** Examples

 testthat::expect_silent(check_beauti_options(create_beauti_options()))

 # Must stop on nonsense
 testthat::expect_error(check_beauti_options(beauti_options = "nonsense"))
 testthat::expect_error(check_beauti_options(beauti_options = NULL))
 testthat::expect_error(check_beauti_options(beauti_options = NA))



