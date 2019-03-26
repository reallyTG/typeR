library(qrmtools)


### Name: fit_GEV
### Title: Parameter Estimators of the Generalized Extreme Value
###   Distribution
### Aliases: fit_GEV_quantile fit_GEV_PWM logLik_GEV fit_GEV_MLE
### Keywords: distribution

### ** Examples

## Simulate some data
xi <- 0.5
mu <- -2
sig <- 3
n <- 1000
set.seed(271)
X <- rGEV(n, shape = xi, loc = mu, scale = sig)

## Fitting via matching quantiles
(fit.q <- fit_GEV_quantile(X))
stopifnot(all.equal(fit.q[["shape"]], xi,  tol = 0.12),
          all.equal(fit.q[["loc"]],   mu,  tol = 0.12),
          all.equal(fit.q[["scale"]], sig, tol = 0.005))

## Fitting via PWMs
(fit.PWM <- fit_GEV_PWM(X))
stopifnot(all.equal(fit.PWM[["shape"]], xi,  tol = 0.16),
          all.equal(fit.PWM[["loc"]],   mu,  tol = 0.15),
          all.equal(fit.PWM[["scale"]], sig, tol = 0.08))

## Fitting via MLE
(fit.MLE <- fit_GEV_MLE(X))
(est <- fit.MLE$par) # estimates of xi, mu, sigma
stopifnot(all.equal(est[["shape"]], xi,  tol = 0.07),
          all.equal(est[["loc"]],   mu,  tol = 0.12),
          all.equal(est[["scale"]], sig, tol = 0.06))
fit.MLE$SE # estimated asymp. variances of MLEs = std. errors of MLEs

## Plot the log-likelihood in the shape parameter xi for fixed
## location mu and scale sigma (fixed as generated)
xi. <- seq(-0.1, 0.8, length.out = 65)
logLik <- sapply(xi., function(xi..) logLik_GEV(c(xi.., mu, sig), x = X))
plot(xi., logLik, type = "l", xlab = expression(xi),
     ylab = expression("GEV distribution log-likelihood for fixed"~mu~"and"~sigma))
## => Numerically quite challenging (for this seed!)

## Plot the profile likelihood for these xi's
## Note: As initial values for the nuisance parameters mu, sigma, we
##       use their values in the case xi = 0 (for all fixed xi = xi.,
##       in particular those xi != 0). Furthermore, for the given data X
##       and xi = xi., we make sure the initial value for sigma is so large
##       that the density is not 0 and thus the log-likelihood is finite.
pLL <- sapply(xi., function(xi..) {
    scale.init <- sqrt(6 * var(X)) / pi
    loc.init <- mean(X) - scale.init * 0.5772157
    while(!is.finite(logLik_GEV(c(xi.., loc.init, scale.init), x = X)) &&
          is.finite(scale.init)) scale.init <- scale.init * 2
    optim(c(loc.init, scale.init), fn = function(nuis)
                logLik_GEV(c(xi.., nuis), x = X),
    		        control = list(fnscale = -1))$value
})
plot(xi., pLL, type = "l", xlab = expression(xi),
     ylab = "GEV distribution profile log-likelihood")



