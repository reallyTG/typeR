library(mar1s)


### Name: compose.ar1
### Title: Compose and Decompose AR(1) Process
### Aliases: compose.ar1 decompose.ar1
### Keywords: models multivariate ts

### ** Examples

## Simple
e <- ts(c(0, 1, 0, 1, 0), freq = 12)
compose.ar1(0.1, e)
compose.ar1(0.1, e, 1)

x <- ts(c(0, 1, 0, 1, 0), freq = 12)
decompose.ar1(0.1, x)
decompose.ar1(0.1, x, 1)

## Multiseries
compose.ar1(0.1, ts(cbind(0, 1)))
compose.ar1(0.1, ts(cbind(c(0, 1, 0), c(1, 0, 1))))

decompose.ar1(0.1, ts(cbind(0, 1)))
decompose.ar1(0.1, ts(cbind(c(0, 1, 0), c(1, 0, 1))))

## External regressors
xreg1 <- rep(2, 5)
xreg2 <- matrix(rep(c(2, 1), each = 5), 5, 2)
e <- ts(c(0, 1, 0, 1, 0), freq = 12)
compose.ar1(0.1, e, xregcoef = 0.5, xreg = xreg1)
compose.ar1(0.1, e, xregcoef = 0.5, init = 0, xreg = xreg1, init.xreg = -2)
compose.ar1(0.1, e, xregcoef = c(1, -1), xreg = xreg2)

x <- ts(c(0, 1, 0, 1, 0), freq = 12)
decompose.ar1(0.1, x, xregcoef = 0.5, xreg = xreg1)
decompose.ar1(0.1, x, xregcoef = 0.5, init = 0, xreg = xreg1, init.xreg = -2)
decompose.ar1(0.1, x, xregcoef = c(1, -1), xreg = xreg2)

## Back-test
a <- 0.5
innov <- ts(rnorm(10), frequency = 12)
init <- 1
xrcoef <- seq(-0.1, 0.1, length.out = 3)
xreg <- matrix(1:30, 10, 3)
init.xreg <- 1:3
x <- compose.ar1(a, innov, init, xrcoef, xreg, init.xreg)
r <- decompose.ar1(a, x, init, xrcoef, xreg, init.xreg)
stopifnot(all.equal(innov, r))



