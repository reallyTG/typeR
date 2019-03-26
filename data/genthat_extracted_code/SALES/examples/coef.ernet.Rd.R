library(SALES)


### Name: coef.ernet
### Title: Get coefficients from an ernet object
### Aliases: coef.ernet coef.alspath
### Keywords: models regression

### ** Examples

set.seed(1)
n <- 100
p <- 400
x <- matrix(rnorm(n*p), n, p)
y <- rnorm(n)
tau <- 0.90
pf <- abs(rnorm(p))
pf2 <- abs(rnorm(p))
lambda2 <- 1
m1 <- ernet(y = y, x = x, tau = tau, eps = 1e-8, pf = pf,
            pf2 = pf2, standardize = FALSE, intercept = FALSE,
            lambda2 = lambda2)
as.vector(coef(m1, s = m1$lambda[5]))



