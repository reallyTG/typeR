library(aftgee)


### Name: aftgee
### Title: Least-Squares Approach for Accelerated Failure Time with
###   Generalized Estimating Equation
### Aliases: aftgee
### Keywords: aftgee

### ** Examples

library(survival)
library(copula)
datgen <- function(n = 100, tau = 0.3, cen = 75.4, dim = 2) {
    kt <- iTau(claytonCopula(1), tau)
    copula <- claytonCopula(kt, dim = dim)
    id <- rep(1:n, rep(dim, n))
    x1 <- rbinom(dim * n, 1, 0.5)
    x2 <- rnorm(dim * n)
    ed <- mvdc(copula, rep("weibull", dim), rep(list(list(shape = 1)), dim))
    e <- c(t(rMvdc(n, ed)))
    T <- exp(2 + x1 + x2 + e)
    cstime <- runif(n, 0, cen)
    delta <- (T < cstime) * 1
    Y <- pmin(T, cstime)
    out <- data.frame(T = T, Y = Y, delta = delta, x1 = x1, x2 = x2, id = rep(1:n, each = dim))
    out
}
set.seed(1)
mydata <- datgen(n = 50, dim = 2)
summary(aftgee(Surv(Y, delta) ~ x1 + x2, data = mydata,
               id = id, corstr = "ind", B = 8))
summary(aftgee(Surv(Y, delta) ~ x1 + x2, data = mydata,
               id = id, corstr = "ex", B = 8))



