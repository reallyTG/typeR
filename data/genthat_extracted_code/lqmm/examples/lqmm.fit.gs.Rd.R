library(lqmm)


### Name: lqmm.fit.gs
### Title: Linear Quantile Mixed Models Fitting by Gradient Search
### Aliases: lqmm.fit.gs
### Keywords: fitting

### ** Examples

set.seed(123)

M <- 50
n <- 10
test <- data.frame(x = runif(n*M,0,1), group = rep(1:M,each=n))
test$y <- 10*test$x + rep(rnorm(M, 0, 2), each = n) + rchisq(n*M, 3)
lqmm.ls <- lqmm(fixed = y ~ x, random = ~ 1, group = group,
	data = test, fit = FALSE)

do.call("lqmm.fit.gs", lqmm.ls)




