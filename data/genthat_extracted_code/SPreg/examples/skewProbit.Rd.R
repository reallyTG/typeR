library(SPreg)


### Name: skewProbit
### Title: Fitting Binary Regression with a Skew-Probit Link Function
### Aliases: skewProbit
### Keywords: Skew-probit link

### ** Examples


library(sn)
library(ucminf)

n <- 500
b0 <- 0.34
delta <- 4
b1 <- 1
b2 <- -0.7

set.seed(1234)
x1 <- runif(n, -2, 2)
x2 <- rnorm(n, sd = sqrt(4/3))
eta <- as.numeric(b0 + b1*x1 + b2*x2)
p <- psn(eta, alpha = delta)
y <- rbinom(n, 1, p)

## Not run: 
##D dat <- data.frame(y, x1 = x1, x2 = x2)
##D mod1 <- skewProbit(y ~ x1 + x2, data = dat, penalty = "Jeffrey", cvtCov = FALSE, level = 0.95)
##D mod2 <- skewProbit(y ~ x1 + x2, data = dat, penalty = "Naive", cvtCov = FALSE, level = 0.95)
##D mod3 <- skewProbit(y ~ x1 + x2, data = dat, penalty = "Cauchy", cvtCov = FALSE, level = 0.95)
##D summary(mod1)
##D summary(mod2)
##D summary(mod3)
## End(Not run)



