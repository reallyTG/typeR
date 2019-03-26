library(MGLM)


### Name: MGLMreg
### Title: Fit multivariate response GLM regression
### Aliases: MGLMreg MGLMreg.fit
### Keywords: models regression

### ** Examples

##----------------------------------------##
## Generate data
n <- 2000
p <- 5
d <- 4
m <- rep(20, n)
set.seed(1234)
X <- 0.1* matrix(rnorm(n*p),n, p)
alpha <- matrix(1, p, d-1)
beta <- matrix(1, p, d-1)
Alpha <- exp(X %*% alpha)
Beta <- exp(X %*% beta)
gdm.Y <- rgdirmn(n, m, Alpha, Beta)

##----------------------------------------##
## Regression
gdm.reg <- MGLMreg(gdm.Y~X, dist="GDM", LRT=FALSE)





