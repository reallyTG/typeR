## ----setup---------------------------------------------------------------
library(reda)                    # attach reda package to the search path
packageVersion("reda")           # check the package version
options(digits = 3)              # set the number of significant digits to print
set.seed(123)                    # set random number seed

## ----hpp-----------------------------------------------------------------
## HPP from time 1 to 5 of intensity 1 without covariates
simEvent(rho = 1, origin = 1, endTime = 5)
## HPP from 0 to 10 of baseline hazard rate 0.5 with two covariates
simEvent(z = c(0.2, 0.5), zCoef = c(0.5, - 0.1), rho = 0.5, endTime = 10)

## ----hpp-data-1----------------------------------------------------------
## recurrent events from two processes with same covariates
simEventData(2, z = c(0.2, 0.5), zCoef = c(1, - 0.5), rho = 0.5, endTime = 5)

## ----hpp-data-2----------------------------------------------------------
## recurrent events from two processes
## with different time-invariant covariates and time origins
simEventData(z = cbind(rnorm(2), 0.5), zCoef = c(1, - 0.5),
             rho = 0.2, origin = c(1, 0), endTime = c(10, 9))

## ----hpp-data-3----------------------------------------------------------
## survival data by set 'recurrent = FALSE'
simEventData(z = cbind(rnorm(10), 1), zCoef = c(0.2, - 0.5), rho = 0.1,
             origin = c(0, 1), endTime = stats::rnorm, recurrent = FALSE,
             arguments = list(endTime = list(mean = 10)))

## ----nhpp----------------------------------------------------------------
rhoFun <- function(x, b = 1) (sin(x) + 1) * b
simEvent(rho = rhoFun)

## ----nhpp-data-----------------------------------------------------------
simEventData(z = cbind(rexp(2), c(0, 1)), zCoef = c(0.1, - 0.5),
             rho = rhoFun, arguments = list(rho = list(b = 0.5)))

## ----rgamma-wi-n---------------------------------------------------------
set.seed(123)
simEvent(interarrival = function(n, rate) rgamma(n, shape = 1 / rate))

## ----rgamma-wo-n---------------------------------------------------------
set.seed(123)
simEvent(interarrival = function(rate) rgamma(n = 1, shape = 1 / rate))

## ----time-varying-covariates-1-------------------------------------------
set.seed(123)
zFun1 <- function(time) cbind(time / 10 + 1, as.numeric(time > 1), 0.5)
simEventData(z = zFun1, zCoef = c(0.1, 0.5, - 0.5))

## ----time-varying-covariates-2-------------------------------------------
set.seed(123)
zFun2 <- function(x, a, b) cbind(x / 10 + a, as.numeric(x > b), 0.5)
simEventData(z = zFun2, zCoef = c(0.1, 0.5, - 0.5),
             arguments = list(z = list(a = 1, b = 1)))

## ----time-varying-covariates-3-------------------------------------------
zFun3 <- function(time, a, b) cbind(time / 10 + a, as.numeric(time > b))
(simDat <- simEventData(nProcess = 3, z = zFun3, zCoef = c(- 0.1, 0.5),
                        arguments = list(z = list(a = quote(rpois(1, 10) / 10),
                                                  b = quote(runif(1, 1, 3))))))

## ----check-a-------------------------------------------------------------
## check the values of parameter `a` for different processes
with(simDat, unique(cbind(ID, a = X.1 - time / 10)))

## ----time-varying-coef-1-------------------------------------------------
zCoefFun <- function(time, shift) cbind(sqrt(time / 10), sin(time + shift), 0.1)
simEventData(z = zFun1, zCoef = zCoefFun,
             arguments = list(zCoef = list(shift = 1)))

## ----frailty-gamma-------------------------------------------------------
set.seed(123)
simEventData(z = zFun1, zCoef = c(0.1, 0.5, - 0.5), frailty = stats::rgamma,
             arguments = list(frailty = list(shape = 2, scale = 0.5)))

## ----frailty-lognormal-1-------------------------------------------------
set.seed(123)
## use function `rlnorm` from the stats package
simEvent(z = zFun1, zCoef = c(0.1, 0.5, - 0.5), frailty = stats::rlnorm,
         arguments = list(frailty = list(sdlog = 1)))

## ----frailty-lognormal-2-------------------------------------------------
set.seed(123)
## use a customized function with argument `n` and `sdlog`
logNorm1 <- function(n, sdlog) exp(rnorm(n = n, mean = 0, sd = sdlog))
simEvent(z = zFun1, zCoef = c(0.1, 0.5, - 0.5), frailty = logNorm1,
         arguments = list(frailty = list(sdlog = 1)))

## ----frailty-lognormal-3-------------------------------------------------
set.seed(123)
## use a customized function with argument `sdlog` only
logNorm2 <- function(sdlog) exp(rnorm(n = 1, mean = 0, sd = sdlog))
simEvent(z = zFun1, zCoef = c(0.1, 0.5, - 0.5), frailty = logNorm2,
         arguments = list(frailty = list(sdlog = 1)))

## ----shared-frailty-1----------------------------------------------------
## shared gamma frailty for processes from two clusters
frailtyEffect <- rgamma(2, shape = 2, scale = 0.5)
simEventData(nProcess = 4, z = zFun1, zCoef = c(0.1, 0.5, - 0.5),
             frailty = rep(frailtyEffect, each = 2))

## ----shared-frailty-2----------------------------------------------------
set.seed(123)
simEventData(nProcess = 4, z = zFun1, zCoef = c(0.1, 0.5, - 0.5),
             frailty = frailtyEffect)

## ----weibull-ph----------------------------------------------------------
nProcess <- 10
rho_weibull_ph <- function(x, lambda, p) lambda * p * x ^ (p - 1)
simEventData(z = cbind(rnorm(nProcess), rbinom(nProcess, 1, 0.5)),
             zCoef = c(0.5, 0.2), endTime = rnorm(nProcess, 10),
             recurrent = FALSE, rho = rho_weibull_ph,
             arguments = list(rho = list(lambda = 0.01, p = 2)))

## ----gompertz------------------------------------------------------------
rho_gompertz <- function(time, lambda, alpha) lambda * exp(alpha * time)
simEventData(z = cbind(rnorm(nProcess), rbinom(nProcess, 1, 0.5)),
             zCoef = c(0.5, 0.2), endTime = rnorm(nProcess, 10),
             recurrent = FALSE, rho = rho_gompertz,
             arguments = list(rho = list(lambda = 0.1, alpha = 0.1)))

## ----loglogistic---------------------------------------------------------
rho_loglogistic <- function(time, z, zCoef, p) {
    lambda <- 1 / parametrize(z, zCoef, FUN = "exponential")
    lambda * p * (lambda * time) ^ (p - 1) / (1 + (lambda * time) ^ p)
}
simEventData(z = cbind(1, rnorm(nProcess), rbinom(nProcess, 1, 0.5)),
             zCoef = c(0.3, 0.5, 0.2), end = rnorm(nProcess, 10),
             recurrent = FALSE, relativeRisk = "none", rho = rho_loglogistic,
             arguments = list(rho = list(p = 1.5)))

## ----log-normal----------------------------------------------------------
rho_lognormal <- function(time, z, zCoef, p) {
    foo <- function(x) dnorm(x) / pnorm(x, lower.tail = FALSE)
    alpha <- parametrize(z, zCoef, FUN = "linear") - 1
    w <- p * (log(time) - alpha)
    foo(w) * p / time
}
simEventData(z = cbind(1, rnorm(nProcess), rbinom(nProcess, 1, 0.5)),
             zCoef = c(0.3, 0.5, 0.2), end = rnorm(nProcess, 10),
             recurrent = FALSE, relativeRisk = "none",
             rho = rho_lognormal, method = "inversion",
             arguments = list(rho = list(p = 0.5)))

