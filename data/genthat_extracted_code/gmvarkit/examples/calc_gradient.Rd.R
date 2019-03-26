library(gmvarkit)


### Name: calc_gradient
### Title: Calculate gradient or Hessian matrix
### Aliases: calc_gradient calc_hessian get_gradient get_hessian

### ** Examples

  # Simple function
  foo <- function(x) x^2 + x
  calc_gradient(x=1, fn=foo)
  calc_gradient(x=-0.5, fn=foo)

  # More complicated function
  foo <- function(x, a, b) a*x[1]^2 - b*x[2]^2
  calc_gradient(x=c(1, 2), fn=foo, a=0.3, b=0.1)

  # These examples below use the data 'eurusd' which comes
  # with the package, but in a scaled form.
  data <- cbind(10*eurusd[,1], 100*eurusd[,2])
  colnames(data) <- colnames(eurusd)

  # GMVAR(1,2), d=2 model:
  params122 <- c(0.623, -0.129, 0.959, 0.089, -0.006, 1.006, 1.746,
    0.804, 5.804, 3.245, 7.913, 0.952, -0.037, -0.019, 0.943, 6.926,
    3.982, 12.135, 0.789)
  mod122 <- GMVAR(data, p=1, M=2, params=params122)
  get_gradient(mod122)
  get_hessian(mod122)



