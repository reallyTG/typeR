library(ggvis)


### Name: show_spec
### Title: Print out the vega plot specification
### Aliases: show_spec

### ** Examples

base <- mtcars %>% ggvis(~mpg, ~wt) %>% layer_points()
base %>% show_spec()
base %>% show_spec("scales")



