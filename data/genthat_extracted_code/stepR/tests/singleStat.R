###
# single statistic, has to be implemented for all parametric families
# singleStat <- function(y, value, li, ri, ...)
# return single numeric
###

# family gauss: independent homogeneous gaussian observations
singleStatGauss <- function(y, value, li, ri, sd, ...) {
  length(y[li:ri]) * (mean(y[li:ri]) - value)^2 / 2 / sd^2
}

# family mDependentPS: partial sum statistic for dependent homogeneous gaussian observations
singleStatmDependentPS <- function(y, value, li, ri, covariances, ...) {
  len <- ri - li + 1
  m <- min(len, length(covariances) - 1L)
  varianceSum <- numeric(1)
  if (m == 0) {
    varianceSum <- len * covariances[1]
  } else {
    varianceSum <- len * covariances[1] + 2 * sum((len - 1:m) * covariances[2:(m + 1)])
  }
  sum(y[li:ri] - value)^2 / varianceSum / 2
}

# family hsmuce: independent heterogeneous gaussian observations
singleStatHsmuce <- function(y, value, li, ri, ...) {
  length(y[li:ri]) * (mean(y[li:ri]) - value)^2 / stats::var(y[li:ri]) / 2
}
