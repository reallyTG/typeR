library(ggvis)


### Name: layer_model_predictions
### Title: Overlay model predictions or a smooth curve.
### Aliases: layer_model_predictions layer_smooths

### ** Examples

mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths(se = TRUE)

# Use group by to display multiple smoothes
mtcars %>% ggvis(~wt, ~mpg) %>% group_by(cyl) %>% layer_smooths()

# Control appearance with props
mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_smooths(se = TRUE, stroke := "red", fill := "red", strokeWidth := 5)

# Control the wiggliness with span. Default is 0.75
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>%
  layer_smooths(span = 0.2)
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>%
  layer_smooths(span = 1)
# Map to an input to modify interactively
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>%
  layer_smooths(span = input_slider(0.2, 1))

# Use other modelling functions with layer_model_predictions
mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_points() %>%
  layer_model_predictions(model = "lm") %>%
  layer_model_predictions(model = "MASS::rlm", stroke := "red")

# Custom domain for predictions
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>%
  layer_model_predictions(model = "lm", domain = c(0, 8))
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>%
  layer_model_predictions(model = "lm",
    domain = input_slider(0, 10, value = c(1, 4)))

# layer_smooths() is just compute_smooth() + layer_paths()
# Run loess or other model outside of a visualisation to see what variables
# you get.
mtcars %>% compute_smooth(mpg ~ wt)
mtcars %>% compute_model_prediction(mpg ~ wt, model = "lm")

mtcars %>%
  ggvis(~wt, ~mpg) %>%
  layer_points() %>%
  compute_smooth(mpg ~ wt) %>%
  layer_paths(~pred_, ~resp_, strokeWidth := 2)



