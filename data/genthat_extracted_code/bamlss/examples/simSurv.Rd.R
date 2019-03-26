library(bamlss)


### Name: simSurv
### Title: Simulate Survival Times
### Aliases: simSurv rSurvTime2
### Keywords: survival distribution

### ** Examples

## The following shows the code of the
## wrapper function simSurv().
set.seed(111)
n <- 100
X <- matrix(NA, nrow = n, ncol = 3)
X[, 1] <- runif(n, -1, 1)
X[, 2] <- runif(n, -3, 3)
X[, 3] <- runif(n, -1, 1)

## Specify censoring function.
cens_fct <- function(time, mean_cens) {
  ## Censoring times are independent exponentially distributed.
  censor_time <- rexp(n = length(time), rate = 1 / mean_cens)
  event <- (time <= censor_time)
  t_obs <- apply(cbind(time, censor_time), 1, min)
  ## Return matrix of observed survival times and event indicator.
  return(cbind(t_obs, event))
}

## log(time) is the baseline hazard.
lambda <-  function(time, x) {
  exp(log(time) + 0.7 * x[1] + sin(x[2]) + sin(time * 2) * x[3])
}

## Simulate data with lambda() and cens_fct().
d <- rSurvTime2(lambda, X, cens_fct, mean_cens = 5)



