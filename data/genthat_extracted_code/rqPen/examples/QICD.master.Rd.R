library(rqPen)


### Name: QICD.master
### Title: Master QICD Function for Regular QICD, group QICD, and Partially
###   Penalized QICD with Multiple Lambdas
### Aliases: QICD.master

### ** Examples

n = 50
p = 100
x <- matrix(rnorm(n*p), nrow=n)
y <- 0 + x[,1] - 3*x[,5] + rnorm(n)
lambda <- exp(-20:0)
# fit1 <- QICD.master(y,x, tau=.5, lambda=lambda, intercept=TRUE, penalty="SCAD")
# fit2 <- QICD.master(y,x, tau=.7, lambda=lambda, intercept=TRUE, penalty="SCAD")
# head(fit1)
# fit2



