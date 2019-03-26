library(msir)


### Name: msir
### Title: Model-based Sliced Inverse Regression (MSIR)
### Aliases: msir print.msir
### Keywords: regression multivariate

### ** Examples

# 1-dimensional simple regression
n <- 200
p <- 5
b <- as.matrix(c(1,-1,rep(0,p-2)))
x <- matrix(rnorm(n*p), nrow = n, ncol = p)
y <- exp(0.5 * x%*%b) + 0.1*rnorm(n)
MSIR <- msir(x, y)
summary(MSIR)
plot(MSIR, type = "2Dplot")

# 1-dimensional symmetric response curve
n <- 200
p <- 5
b <- as.matrix(c(1,-1,rep(0,p-2)))
x <- matrix(rnorm(n*p), nrow = n, ncol = p)
y <- (0.5 * x%*%b)^2 + 0.1*rnorm(n)
MSIR <- msir(x, y)
summary(MSIR)
plot(MSIR, type = "2Dplot")
plot(MSIR, type = "coefficients")

# 2-dimensional response curve
n <- 300
p <- 5
b1 <- c(1, 1, 1, rep(0, p-3))
b2 <- c(1,-1,-1, rep(0, p-3))
b <- cbind(b1,b2)
x <- matrix(rnorm(n*p), nrow = n, ncol = p)
y <- x %*% b1 + (x %*% b1)^3 + 4*(x %*% b2)^2 + rnorm(n)
MSIR <- msir(x, y)
summary(MSIR)
plot(MSIR, which = 1:2)
## Not run: plot(MSIR, type = "spinplot")
plot(MSIR, which = 1, type = "2Dplot", span = 0.7)
plot(MSIR, which = 2, type = "2Dplot", span = 0.7)



