library(ZIM)


### Name: ZINB
### Title: The Zero-Inflated Negative Binomial Distribution
### Aliases: ZINB dzinb pzinb qzinb rzinb
### Keywords: distribution

### ** Examples

dzinb(x = 0:10, k = 1, lambda = 1, omega = 0.5)
pzinb(q = c(1, 5, 9), k = 1, lambda = 1, omega = 0.5)
qzinb(p = c(0.25, 0.50, 0.75), k = 1, lambda = 1, omega = 0.5)
set.seed(123)
rzinb(n = 100, k = 1, lambda = 1, omega = 0.5)



