library(qrcmNP)


### Name: gof.piqr
### Title: Goodness of Fit of Penalized Quantile Regression Coefficients
###   Modeling
### Aliases: gof.piqr

### ** Examples


# using simulated data

set.seed(1234)
n <- 300
x1 <- rexp(n)
x2 <- runif(n, 0, 5)
x <- cbind(x1,x2)

b <- function(p){matrix(cbind(1, qnorm(p), slp(p, 2)), nrow=4, byrow=TRUE)}
theta <- matrix(0, nrow=3, ncol=4); theta[, 1] <- 1; theta[1,2] <- 1; theta[2:3,3] <- 2
qy <- function(p, theta, b, x){rowSums(x * t(theta %*% b(p)))}

y <- qy(runif(n), theta, b, cbind(1, x))

s <- matrix(1, nrow=3, ncol=4); s[1,3:4] <- 0
obj <- piqr(y ~ x1 + x2, formula.p = ~ I(qnorm(p)) + slp(p, 2), s=s, nlambda=50)

par(mfrow=c(1,2))
best <- gof.piqr(obj, method="AIC", plot=TRUE)
best2 <- gof.piqr(obj, method="BIC", plot=TRUE)



