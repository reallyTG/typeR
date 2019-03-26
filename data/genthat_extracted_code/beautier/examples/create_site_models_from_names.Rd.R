library(beautier)


### Name: create_site_models_from_names
### Title: Create site models from their names
### Aliases: create_site_models_from_names

### ** Examples

  names <- get_site_model_names()
  site_models <- create_site_models_from_names(names)

  for (i in seq_along(names)) {
    testthat::expect_equal(names[i], site_models[[i]]$name)
  }



