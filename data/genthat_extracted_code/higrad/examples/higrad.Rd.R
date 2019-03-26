library(higrad)


### Name: higrad
### Title: Fitting HiGrad
### Aliases: higrad

### ** Examples

# fitting linear regression on a simulated dataset
n <- 1e3
d <- 10
sigma <- 0.1
theta <- rep(1, d)
x <- matrix(rnorm(n * d), n, d)
y <- as.numeric(x %*% theta + rnorm(n, 0, sigma))
fit <- higrad(x, y, model = "lm")
print(fit)
# predict for 10 new samples
newx <- matrix(rnorm(10 * d), 10, d)
pred <- predict(fit, newx)
pred




