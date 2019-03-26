library(acrt)


### Name: F.type.test.statistic
### Title: Computation of F-type test statistics
### Aliases: F.type.test.statistic

### ** Examples

n <- 100
y <- rnorm(n)
X <- cbind(rep(1, length = n), rnorm(n))
R <- matrix(c(0, 1), nrow = 1, ncol = 2)
r <- 0
bandwidth <- n/10
ker <- "Bartlett"
F.type.test.statistic(y, R, r, X, bandwidth, ker)



