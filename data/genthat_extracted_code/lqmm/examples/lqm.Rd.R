library(lqmm)


### Name: lqm
### Title: Fitting Linear Quantile Models
### Aliases: lqm
### Keywords: quantile regression

### ** Examples


set.seed(123)
n <- 500
p <- 1:3/4
test <- data.frame(x = runif(n,0,1))
test$y <- 30 + test$x + rnorm(n)
fit.lqm <- lqm(y ~ x, data = test, tau = p,
	control = list(verbose = FALSE, loop_tol_ll = 1e-9), fit = TRUE)
fit.lqm



