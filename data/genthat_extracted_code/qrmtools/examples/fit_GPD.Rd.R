library(qrmtools)


### Name: fit_GPD
### Title: Parameter Estimators of the Generalized Pareto Distribution
### Aliases: fit_GPD_MOM fit_GPD_PWM logLik_GPD fit_GPD_MLE
### Keywords: distribution

### ** Examples

## Simulate some data
xi <- 0.5
beta <- 3
n <- 1000
set.seed(271)
X <- rGPD(n, shape = xi, scale = beta)

## Fitting via matching moments
(fit.MOM <- fit_GPD_MOM(X))
stopifnot(all.equal(fit.MOM[["shape"]], xi,   tol = 0.52),
          all.equal(fit.MOM[["scale"]], beta, tol = 0.24))

## Fitting via PWMs
(fit.PWM <- fit_GPD_PWM(X))
stopifnot(all.equal(fit.PWM[["shape"]], xi,   tol = 0.2),
          all.equal(fit.PWM[["scale"]], beta, tol = 0.12))

## Fitting via MLE
(fit.MLE <- fit_GPD_MLE(X))
(est <- fit.MLE$par) # estimates of xi, mu, sigma
stopifnot(all.equal(est[["shape"]], xi,   tol = 0.12),
          all.equal(est[["scale"]], beta, tol = 0.11))
fit.MLE$SE # estimated asymp. variances of MLEs = std. errors of MLEs

## Plot the log-likelihood in the shape parameter xi for fixed
## scale beta (fixed as generated)
xi. <- seq(-0.1, 0.8, length.out = 65)
logLik <- sapply(xi., function(xi..) logLik_GPD(c(xi.., beta), x = X))
plot(xi., logLik, type = "l", xlab = expression(xi),
     ylab = expression("GPD log-likelihood for fixed"~beta))

## Plot the profile likelihood for these xi's
## (with an initial interval for the nuisance parameter beta such that
##  logLik_GPD() is finite)
pLL <- sapply(xi., function(xi..) {
    ## Choose beta interval for optimize()
    int <- if(xi.. >= 0) {
               ## Method-of-Moment estimator
               mu.hat <- mean(X)
               sig2.hat <- var(X)
               shape.hat <- (1-mu.hat^2/sig2.hat)/2
               scale.hat <- mu.hat*(1-shape.hat)
               ## log-likelihood always fine for xi.. >= 0 for all beta
               c(1e-8, 2 * scale.hat)
           } else { # xi.. < 0
               ## Make sure logLik_GPD() is finite at endpoints of int
               mx <- max(X)
               -xi.. * mx * c(1.01, 100) # -xi * max(X) * scaling
               ## Note: for shapes xi.. closer to 0, the upper scaling factor
               ##       needs to be chosen sufficiently large in order
               ##       for optimize() to find an optimum (not just the
               ##       upper end point). Try it with '2' instead of '100'.
           }
    ## Optimization
    optimize(function(nuis) logLik_GPD(c(xi.., nuis), x = X),
             interval = int, maximum = TRUE)$maximum
})
plot(xi., pLL, type = "l", xlab = expression(xi),
     ylab = "GPD profile log-likelihood")



