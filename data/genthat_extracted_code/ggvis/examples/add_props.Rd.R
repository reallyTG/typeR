library(ggvis)


### Name: add_props
### Title: Add visual properties to a visualisation
### Aliases: add_props

### ** Examples

mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()
mtcars %>% ggvis() %>% add_props(~wt, ~mpg) %>% layer_points()
mtcars %>% ggvis(~wt) %>% add_props(y = ~mpg) %>% layer_points()



