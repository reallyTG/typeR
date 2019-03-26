library(lazyeval)


### Name: common_env
### Title: Find common environment in list of lazy objects.
### Aliases: common_env
### Keywords: internal

### ** Examples

common_env(lazy_dots(a, b, c))

f <- function(x) ~x
common_env(list(f(1)))
common_env(list(f(1), f(2)))



