library(kdensity)


### Name: parametric_starts
### Title: Parametric starts
### Aliases: parametric_starts

### ** Examples

start_exponential = list(
 density = dexp,
 estimator = function(data) {
   c(rate = 1/mean(data))
 },
 support = c(0, Inf)
)

start_inverse_gaussian = list(
 density = extraDistr::dwald,
 estimator = function(data) {
  c(mu = mean(data),
    lambda = mean(1/data - 1/mean(data)))
  },
 support = c(0, Inf)
)




