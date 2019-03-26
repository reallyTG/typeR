library(rqPen)


### Name: QICD
### Title: Penalized Quantile Regression with QICD Algorithm
### Aliases: QICD

### ** Examples

n = 50
p = 100
x <- matrix(rnorm(n*p),nrow=n)
y <- 0 + x[,1] - 3*x[,5] + rnorm(n)
fit1 <- QICD(y,x, tau=.5, lambda=1, intercept=TRUE, penalty="SCAD")
fit2 <- QICD(y,x, tau=.7, lambda=1, intercept=TRUE, penalty="SCAD")



