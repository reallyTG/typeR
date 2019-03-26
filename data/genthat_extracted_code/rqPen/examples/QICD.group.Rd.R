library(rqPen)


### Name: QICD.group
### Title: Group Penalized Quantile Regression with QICD Algorithm
### Aliases: QICD.group

### ** Examples

library(splines)
n = 50
p = 100
x <- matrix(rnorm(n*p),nrow=n)
z1 <- runif(n)
z2 <- runif(n)
x <- cbind(x, bs(z1), bs(z2))
groups <- c( 1:p, rep(101,3), rep(102,3) )
y <- 0 + x[,1] - 3*x[,5] + z1^3 + rnorm(n)
fit1 <- QICD.group(y,x, groups, tau=.5, lambda=1, intercept=TRUE, penalty="SCAD")
fit2 <- QICD.group(y,x, groups, tau=.7, lambda=1, intercept=TRUE, penalty="SCAD")



