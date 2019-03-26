library(oem)


### Name: predict.oem
### Title: Prediction method for Orthogonalizing EM fitted objects
### Aliases: predict.oem

### ** Examples

set.seed(123)
n.obs <- 1e4
n.vars <- 100
n.obs.test <- 1e3

true.beta <- c(runif(15, -0.5, 0.5), rep(0, n.vars - 15))

x <- matrix(rnorm(n.obs * n.vars), n.obs, n.vars)
y <- rnorm(n.obs, sd = 3) + x %*% true.beta
x.test <- matrix(rnorm(n.obs.test * n.vars), n.obs.test, n.vars)
y.test <- rnorm(n.obs.test, sd = 3) + x.test %*% true.beta

fit <- oem(x = x, y = y, 
           penalty = c("lasso", "grp.lasso"), 
           groups = rep(1:10, each = 10), 
           nlambda = 10)

preds.lasso <- predict(fit, newx = x.test, type = "response", which.model = 1)
preds.grp.lasso <- predict(fit, newx = x.test, type = "response", which.model = 2)

apply(preds.lasso,     2, function(x) mean((y.test - x) ^ 2))
apply(preds.grp.lasso, 2, function(x) mean((y.test - x) ^ 2))




