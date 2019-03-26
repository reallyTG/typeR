###
# compute local estimator, has to be implemented for all parametric families
# localEst <- function(y, left, right, lb, ub, ...)
# further parameters can be added,
# but ... is always necessary to absorb unused parameters
# return single numeric
###

# family Gauss: independent homogeneous gaussian observations
localEstGauss <- function(y, left, right, lb, ub, ...) {
  max(min(mean(y[left:right]), ub), lb)
}
