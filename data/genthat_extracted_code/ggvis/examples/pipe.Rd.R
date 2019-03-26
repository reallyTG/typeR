library(ggvis)


### Name: %>%
### Title: Pipe graphics
### Aliases: %>%

### ** Examples

# Instead of
layer_points(ggvis(mtcars, ~mpg, ~wt))
# you can write
mtcars %>% ggvis(~mpg, ~wt) %>% layer_points()



