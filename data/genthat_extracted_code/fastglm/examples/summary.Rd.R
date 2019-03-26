library(fastglm)


### Name: summary.fastglm
### Title: summary method for fastglm fitted objects
### Aliases: summary.fastglm

### ** Examples


x <- matrix(rnorm(10000 * 10), ncol = 10)
y <- 1 * (0.25 * x[,1] - 0.25 * x[,3] > rnorm(10000))

fit <- fastglm(x, y, family = binomial())

#summary(fit)





