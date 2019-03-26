###
# single bounds, has to be implemented for all parametric families
# singleBounds <- function(y, criticalValue, li, ri, ...)
# return single numeric
###

# family gauss: independent homogeneous gaussian observations
singleBoundsGauss <- function(y, criticalValue, li, ri, sd) {
  len <- ri - li + 1
  m <- mean(y[li:ri])
  s <- sd * sqrt(2 * criticalValue / len)
  c(m - s, m + s)
}

# family gaussDependent: partial sum statistic for dependent homogeneous gaussian observations
singleBoundsmDependentPS <- function(y, criticalValue, li, ri, covariances) {
  len <- ri - li + 1
  m <- min(len, length(covariances) - 1L)
  varianceSum <- numeric(1)
  if (m == 0) {
    varianceSum <- len * covariances[1]
  } else {
    varianceSum <- len * covariances[1] + 2 * sum((len - 1:m) * covariances[2:(m + 1)])
  }
  m <- mean(y[li:ri])
  s <- sqrt(2 * varianceSum * criticalValue) / len
  c(m - s, m + s)
}

# family hsmuce: independent heterogeneous gaussian observations
singleBoundsHsmuce <- function(y, criticalValue, li, ri) {
  len <- ri - li + 1
  m <- mean(y[li:ri])
  s <- stats::sd(y[li:ri]) * sqrt(2 * criticalValue / len)
  c(m - s, m + s)
}
