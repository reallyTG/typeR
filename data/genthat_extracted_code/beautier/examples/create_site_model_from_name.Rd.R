library(beautier)


### Name: create_site_model_from_name
### Title: Create a site model from name
### Aliases: create_site_model_from_name

### ** Examples

  site_model_names <- get_site_model_names()
  for (site_model_name in site_model_names) {
    site_model <- create_site_model_from_name(site_model_name)
    testthat::expect_equal(site_model_name, site_model$name)
  }



