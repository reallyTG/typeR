library(ggvis)


### Name: set_options
### Title: Set options for a ggvis plot
### Aliases: set_options

### ** Examples

mtcars %>%
  ggvis(~wt, ~mpg) %>%
  layer_points() %>%
  set_options(width = 300, height = 200, padding = padding(10, 10, 10, 10))

# Display the default options
str(default_options())




