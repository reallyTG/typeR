library(psychmeta)


### Name: filter_r
### Title: Filter to detect and remove impossible values in vectors of
###   correlations and sample sizes.
### Aliases: filter_r
### Keywords: internal

### ** Examples

## Not run
## filter_r(r_vec = c(-.3, .5, 1.1), n_vec = c(100, 100, 100))
## filter_r(r_vec = c(-.3, .5, .8), n_vec = c(Inf, 100, 100))
## filter_r(r_vec = c(-.3, .5, .8), n_vec = c(2, 100, 100))



