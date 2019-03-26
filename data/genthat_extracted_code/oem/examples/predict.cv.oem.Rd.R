library(oem)


### Name: predict.cv.oem
### Title: Prediction function for fitted cross validation oem objects
### Aliases: predict.cv.oem

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

fit <- cv.oem(x = x, y = y, 
              penalty = c("lasso", "grp.lasso"), 
              groups = rep(1:10, each = 10), 
              nlambda = 10)

preds.best <- predict(fit, newx = x.test, type = "response", which.model = "best.model")

apply(preds.best, 2, function(x) mean((y.test - x) ^ 2))

preds.gl <- predict(fit, newx = x.test, type = "response", which.model = "grp.lasso")

apply(preds.gl, 2, function(x) mean((y.test - x) ^ 2))

preds.l <- predict(fit, newx = x.test, type = "response", which.model = 1)

apply(preds.l, 2, function(x) mean((y.test - x) ^ 2))



