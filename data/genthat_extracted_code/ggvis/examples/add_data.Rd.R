library(ggvis)


### Name: add_data
### Title: Add dataset to a visualisation
### Aliases: add_data

### ** Examples

mtcars %>% ggvis(~mpg, ~wt) %>% layer_points()
NULL %>% ggvis(~mpg, ~wt) %>% add_data(mtcars) %>% layer_points()



