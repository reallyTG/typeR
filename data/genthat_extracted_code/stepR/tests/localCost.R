###
# compute local cost, has to be implemented for all parametric families
# localCost <- function(y, left, right, est, ...)
# return single numeric
###

# family gauss: independent homogeneous gaussian observations
localCostGauss <- function(y, left, right, est, ...) {
  -2 * (sum(log(dnorm(y[left:right], est, 1))) + (right - left + 1) / 2 * log(2 * pi * 1^2)) - sum(y[left:right]^2)
}

# family hsmuce: independent heterogeneous gaussian observations
localCostHsmuce <- function(y, left, right, est, ...) {
  if (right == left) {
    return(-log(2 * pi) - 1)
  }
  -2 * sum(dnorm(y[left:right], mean = est, sd = sqrt(mean((y[left:right] - est)^2)), log = TRUE)
           + log(2 * pi) / 2 + 1 / 2)
}
