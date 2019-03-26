library(lqmm)


### Name: lqm.fit.gs
### Title: Quantile Regression Fitting by Gradient Search
### Aliases: lqm.fit.gs
### Keywords: fitting

### ** Examples


set.seed(123)
n <- 500
test <- data.frame(x = runif(n,0,1))
test$y <- 30 + test$x + rnorm(n)
lqm.ls <- lqm(y ~ x, data = test, fit = FALSE)

do.call("lqm.fit.gs", lqm.ls)



