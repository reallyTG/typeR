library(beautier)


### Name: check_site_models
### Title: Check if the object is a list of one or more site models.
### Aliases: check_site_models

### ** Examples

  testthat::expect_silent(check_site_models(create_jc69_site_model()))
  testthat::expect_silent(check_site_models(list(create_jc69_site_model())))
  testthat::expect_silent(
    check_site_models(
      list(create_jc69_site_model(), create_gtr_site_model())
    )
  )

  testthat::expect_error(check_site_models("nonsense"))
  testthat::expect_error(check_site_models(3.14))
  testthat::expect_error(check_site_models(42))
  testthat::expect_error(check_site_models(NA))
  testthat::expect_error(check_site_models(NULL))



