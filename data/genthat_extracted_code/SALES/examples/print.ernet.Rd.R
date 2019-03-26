library(SALES)


### Name: print.ernet
### Title: Print an ernet object
### Aliases: print.ernet
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
print(m1)



