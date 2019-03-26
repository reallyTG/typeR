library(ggvis)


### Name: compute_density
### Title: Compute density of data.
### Aliases: compute_density

### ** Examples

mtcars %>% compute_density(~mpg, n = 5)
mtcars %>% group_by(cyl) %>% compute_density(~mpg, n = 5)
mtcars %>% ggvis(~mpg) %>% compute_density(~mpg, n = 5) %>%
  layer_points(~pred_, ~resp_)



