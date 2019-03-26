library(Countr)


### Name: surv
### Title: Wrapper to built in survival functions
### Aliases: surv

### ** Examples

tt <- 2.5
## weibull

distP <- list(scale = 1.2, shape = 1.16)
alpha <- exp(-log(distP[["scale"]]) / distP[["shape"]])
pweibull(q = tt, scale = alpha, shape = distP[["shape"]],
                      lower.tail = FALSE)
surv(tt, distP, "weibull") ## (almost) same

## gamma
distP <- list(shape = 0.5, rate = 1.0 / 0.7)
pgamma(q = tt, rate = distP[["rate"]], shape = distP[["shape"]],
                    lower.tail = FALSE)
surv(tt, distP, "gamma")  ## (almost) same

## generalized gamma
distP <- list(mu = 0.5, sigma = 0.7, Q = 0.7)
flexsurv::pgengamma(q = tt, mu = distP[["mu"]],
                    sigma = distP[["sigma"]],
                    Q = distP[["Q"]],
                    lower.tail = FALSE)
surv(tt, distP, "gengamma")  ## (almost) same




