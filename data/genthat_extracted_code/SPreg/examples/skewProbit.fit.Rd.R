library(SPreg)


### Name: skewProbit.fit
### Title: Fitting Binary Regression with a Skew-Probit Link Function
### Aliases: skewProbit.fit

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

x <- cbind(1, x1, x2)
## Not run: 
##D mod1 <- skewProbit.fit(y, x, penalty = "Jeffrey", cvtCov = FALSE)
##D mod2 <- skewProbit.fit(y, x, penalty = "Naive", cvtCov = FALSE)
##D mod3 <- skewProbit.fit(y, x, penalty = "Cauchy", cvtCov = FALSE)
##D mod1$coef
##D mod2$coef
##D mod3$coef
##D 
## End(Not run) 



