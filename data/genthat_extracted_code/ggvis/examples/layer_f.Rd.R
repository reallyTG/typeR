library(ggvis)


### Name: layer_f
### Title: Create a new layering function.
### Aliases: layer_f
### Keywords: internal

### ** Examples

mtcars %>% ggvis(~mpg) %>%
  layer_f(function(v) {
     v %>% compute_bin(~mpg) %>% layer_points(x = ~x_, y = ~count_)
  }) %>%
  layer_points(y = ~wt)



