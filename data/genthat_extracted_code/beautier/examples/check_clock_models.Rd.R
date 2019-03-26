library(beautier)


### Name: check_clock_models
### Title: Check if the object is a list of one or more clock models.
### Aliases: check_clock_models

### ** Examples

  testthat::expect_silent(check_clock_models(create_strict_clock_model()))
  testthat::expect_silent(
    check_clock_models(list(create_strict_clock_model()))
  )
  testthat::expect_silent(
    check_clock_models(
      list(create_strict_clock_model(), create_rln_clock_model())
    )
  )

  testthat::expect_error(check_clock_models("nonsense"))
  testthat::expect_error(check_clock_models(3.14))
  testthat::expect_error(check_clock_models(42))
  testthat::expect_error(check_clock_models(NA))
  testthat::expect_error(check_clock_models(NULL))



