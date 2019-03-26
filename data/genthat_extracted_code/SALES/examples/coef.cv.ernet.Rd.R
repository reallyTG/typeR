library(SALES)


### Name: coef.cv.ernet
### Title: Get coefficients from a cv.ernet object
### Aliases: coef.cv.ernet
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
m1.cv <- cv.ernet(y = y, x = x, tau = tau, eps = 1e-8, pf = pf,
            pf2 = pf2, standardize = FALSE, intercept = FALSE, 
            lambda2 = lambda2)
as.vector(coef(m1.cv, s = "lambda.min"))



