library(lqmm)


### Name: summary.lqm
### Title: Summary for an 'lqm' Object
### Aliases: summary.lqm
### Keywords: bootstrap standard errors

### ** Examples


set.seed(12356)
n <- 200
p <- 1:3/4
test <- data.frame(x = runif(n,0,1))
test$y <- 30 + test$x + rnorm(n)
fit.lqm <- lqm(y ~ x, data = test, tau = p)
summary(fit.lqm, R = 50)




