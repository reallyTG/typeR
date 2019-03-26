library(vctrs)


### Name: vec_size
### Title: Number of observations
### Aliases: vec_size vec_size_common

### ** Examples

vec_size(1:100)
vec_size(mtcars)
vec_size(array(dim = c(3, 5, 10)))

vec_size(NULL)
# Because vec_size(vec_c(NULL, x)) ==
#   vec_size(NULL) + vec_size(x) ==
#   vec_size(x)

vec_size_common(1:10, 1:10)
vec_size_common(1:10, 1)
vec_size_common(1:10, integer())



