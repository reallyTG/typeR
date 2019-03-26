library(LICORS)


### Name: get_LC_config
### Title: Get configuration of a light cone (LC)
### Aliases: get_LC_config
### Keywords: method utilities

### ** Examples

AA <- matrix(rnorm(40), ncol = 5)
image2(AA)
LCind <- compute_LC_coordinates(speed = 1, horizon = 1, shape = "cone")
AA
get_LC_config(cbind(5, 2), AA, LCind)
# a time series example
data(nhtemp)
xx <- c(nhtemp)
LCind <- compute_LC_coordinates(speed = 1, horizon = 4, shape = "cone", space.dim = 0)
cc <- get_LC_config(6, xx, LCind)



