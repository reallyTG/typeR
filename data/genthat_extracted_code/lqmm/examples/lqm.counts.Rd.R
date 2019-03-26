library(lqmm)


### Name: lqm.counts
### Title: Quantile Regression for Counts
### Aliases: lqm.counts
### Keywords: quantiles for counts

### ** Examples


n <- 100
x <- runif(n)
test <- data.frame(x = x, y = rpois(n, 2*x))
lqm.counts(y ~ x, data = test, M = 50)





