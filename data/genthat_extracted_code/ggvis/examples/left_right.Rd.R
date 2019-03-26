library(ggvis)


### Name: left_right
### Title: Interactive inputs bound to arrow keys.
### Aliases: left_right up_down

### ** Examples

size <- left_right(1, 801, value = 51, step = 50)
opacity <- up_down(0, 1, value = 0.9, step = 0.05)

mtcars %>% ggvis(~mpg, ~wt, size := size, opacity := opacity) %>%
  layer_points()



