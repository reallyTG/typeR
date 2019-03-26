library(beautier)


### Name: check_site_model
### Title: Check if the site model is a valid site model
### Aliases: check_site_model

### ** Examples

 testthat::expect_silent(check_site_model(create_jc69_site_model()))
 testthat::expect_silent(check_site_model(create_hky_site_model()))
 testthat::expect_silent(check_site_model(create_tn93_site_model()))
 testthat::expect_silent(check_site_model(create_gtr_site_model()))

 # Can use list of one site model
 testthat::expect_silent(check_site_model(list(create_jc69_site_model())))

 # List of two site models is not a/one site model
 testthat::expect_error(
   check_site_model(
     list(create_jc69_site_model(), create_jc69_site_model())
   )
 )

 # Must stop on non-site models
 testthat::expect_error(check_site_model(site_model = "nonsense"))
 testthat::expect_error(check_site_model(site_model = NULL))
 testthat::expect_error(check_site_model(site_model = NA))



