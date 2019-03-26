library(censCov)


### Name: thlm
### Title: Threshold regression with a censored covariate
### Aliases: thlm

### ** Examples

simDat <- function(n) {
    X <- rexp(n, 3)
    Z <- runif(n, 1, 6)
    Y <- 0.5 + 0.5 * X - 0.5 * Z + rnorm(n, 0, .75)
    cstime <- rexp(n, .75)
    delta <- (X <= cstime) * 1
    X <- pmin(X, cstime)
    data.frame(Y = Y, X = X, Z = Z, delta = delta)
}
set.seed(0)
dat <- simDat(200)

## Falsely assumes all covariates are free of censoring
thlm(Y ~ X + Z, data = dat)

## Complete cases regression
thlm(Y ~ X + Z, cens = delta, data = dat)
thlm(Y ~ X + Z, data = dat, subset = delta == 1) ## same results

## reverse survival regression
thlm(Y ~ X + Z, cens = delta, data = dat, method = "reverse")

## threshold regression without bootstrap
thlm(Y ~ X + Z, cens = delta, data = dat, method = "dt")
thlm(Y ~ X + Z, cens = delta, data = dat, method = "ct", control =
list(t0.interval = c(0.2, 0.6), t0.plot = FALSE))

## threshold regression with bootstrap
thlm(Y ~ X + Z, cens = delta, data = dat, method = "dt", B = 100)
thlm(Y ~ X + Z, cens = delta, data = dat, method = "ct", B = 100)

## display all
thlm(Y ~ X + Z, cens = delta, data = dat, method = "all", B = 100)




