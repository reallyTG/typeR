library(beautier)


### Name: create_clock_models_from_names
### Title: Create clock models from their names
### Aliases: create_clock_models_from_names

### ** Examples

  names <- get_clock_model_names()
  clock_models <- create_clock_models_from_names(names)

  for (i in seq_along(names)) {
    testthat::expect_equal(names[i], clock_models[[i]]$name)
  }



