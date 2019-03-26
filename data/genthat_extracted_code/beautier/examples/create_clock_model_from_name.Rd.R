library(beautier)


### Name: create_clock_model_from_name
### Title: Create a clock model from name
### Aliases: create_clock_model_from_name

### ** Examples

  clock_model_names <- get_clock_model_names()
  for (clock_model_name in clock_model_names) {
    clock_model <- create_clock_model_from_name(clock_model_name)
    testthat::expect_equal(clock_model_name, clock_model$name)
  }



