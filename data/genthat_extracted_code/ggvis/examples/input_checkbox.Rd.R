library(ggvis)


### Name: input_checkbox
### Title: Create an interactive checkbox.
### Aliases: input_checkbox

### ** Examples


input_checkbox(label = "Confidence interval")
input_checkbox(label = "Confidence interval", value = TRUE)

# Used in layer_smooths
mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_smooths(se = input_checkbox(label = "Confidence interval"))

# Used with a map function, to convert the boolean to another type of value
model_type <- input_checkbox(label = "Use flexible curve",
  map = function(val) if(val) "loess" else "lm")
mtcars %>% ggvis(~wt, ~mpg) %>%
  layer_model_predictions(model = model_type)



