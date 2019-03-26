library(purrr)


### Name: vec_depth
### Title: Compute the depth of a vector
### Aliases: vec_depth

### ** Examples

x <- list(
  list(),
  list(list()),
  list(list(list(1)))
)
vec_depth(x)
x %>% map_int(vec_depth)



