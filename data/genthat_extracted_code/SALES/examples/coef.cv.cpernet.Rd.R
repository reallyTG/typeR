library(SALES)


### Name: coef.cv.cpernet
### Title: Get coefficients from a cv.cpernet object
### Aliases: coef.cv.cpernet
### Keywords: models regression

### ** Examples

set.seed(1)
n <- 100
p <- 400
x <- matrix(rnorm(n*p), n, p)
y <- rnorm(n)
tau <- 0.30
pf <- abs(rnorm(p))
pf2 <- abs(rnorm(p))
w <- 2.0
lambda2 <- 1
m2.cv <- cv.cpernet(y = y, x = x, w = w, tau = tau, eps = 1e-8, 
              pf.mean = pf, pf.scale = pf2,
              standardize = FALSE, lambda2 = lambda2)
as.vector(coef(m2.cv, s = "lambda.min")$beta)
as.vector(coef(m2.cv, s = "lambda.min")$theta)



