library(ggvis)


### Name: compute_model_prediction
### Title: Create a model of a data set and compute predictions.
### Aliases: compute_model_prediction compute_smooth

### ** Examples

# Use a small value of n for these examples
mtcars %>% compute_model_prediction(mpg ~ wt, n = 10)
mtcars %>% compute_model_prediction(mpg ~ wt, n = 10, se = TRUE)
mtcars %>% group_by(cyl) %>% compute_model_prediction(mpg ~ wt, n = 10)

# compute_smooth defaults to loess
mtcars %>% compute_smooth(mpg ~ wt)

# Override model to suppress message or change approach
mtcars %>% compute_model_prediction(mpg ~ wt, n = 10, model = "loess")
mtcars %>% compute_model_prediction(mpg ~ wt, n = 10, model = "lm")

# Set the domain manually
mtcars %>%
  compute_model_prediction(mpg ~ wt, n = 20, model = "lm", domain = c(0, 8))

# Plot the results
mtcars %>% compute_model_prediction(mpg ~ wt) %>%
  ggvis(~pred_, ~resp_) %>%
  layer_paths()
mtcars %>% ggvis() %>%
  compute_model_prediction(mpg ~ wt) %>%
  layer_paths(~pred_, ~resp_)



