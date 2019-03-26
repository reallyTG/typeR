library(visualize)


### Name: visualize.distributions
### Title: Visualize's Supported Distributions
### Aliases: visualize.distributions
### Keywords: datasets internal

### ** Examples


visualize.distributions = list(
  'beta' = list(
    type = "continuous",
    name = "Beta Distribution",
    variable = "b",
    varsymbols = c("\u03B1","\u03B2"),
    params = 2,
    init  = function(params, ...) {
      shape1 = params[[1]]; shape2 = params[[2]]
      if(shape1 <= 0 || shape2 <= 0) stop("Error: Need alpha, beta  > 0")
      mean = shape1 / (shape1 + shape2)
      var = (shape1 * shape2)/((shape1 + shape2 + 1)*(shape1 + shape2)^2)
      c(mean, var)
    },
    density = function(x,params, ncp = 0, lower.tail = TRUE, log = FALSE, ...){
      if(params[[1]] <= 0 || params[[2]] <= 0) stop("Error: Need alpha, beta  > 0")
        dbeta(x,params[[1]], params[[2]], ncp = ncp, log = log)
    },
    probability = function(q,params, ncp = 0, lower.tail = TRUE, log.p = FALSE, ...){
      if(params[[1]] <= 0 || params[[2]] <= 0) stop("Error: Need alpha, beta  > 0")
      pbeta(q,params[[1]], params[[2]], ncp = ncp, lower.tail = lower.tail, log.p = log.p)
    },
    quantile = function(p,params, ncp = 0, lower.tail = TRUE, log.p = FALSE, ...){
      if(params[[1]] <= 0 || params[[2]] <= 0) stop("Error: Need alpha, beta  > 0")
      qbeta(p,params[[1]], params[[2]], ncp = ncp, lower.tail = lower.tail, log.p = log.p)
    }
  )
)




