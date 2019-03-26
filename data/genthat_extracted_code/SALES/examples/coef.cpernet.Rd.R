library(SALES)


### Name: coef.cpernet
### Title: Get coefficients from a cpernet object
### Aliases: coef.cpernet coef.cpalspath
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
m2 <- cpernet(y = y, x = x, w = w, tau = tau, eps = 1e-8, 
              pf.mean = pf, pf.scale = pf2, intercept = TRUE,
              standardize = FALSE, lambda2 = lambda2)

mean.coef <- as.vector(coef(m2, s = m2$lambda[50])[[1]])
scale.coef <- as.vector(coef(m2, s = m2$lambda[50])[[2]])



