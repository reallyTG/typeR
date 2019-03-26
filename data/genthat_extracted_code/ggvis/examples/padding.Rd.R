library(ggvis)


### Name: padding
### Title: Define padding.
### Aliases: padding

### ** Examples

p <- mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
p %>% set_options(padding = padding())
p %>% set_options(padding = padding(10, 10, 10, 10))



