library(rqPen)


### Name: QICD.nonpen
### Title: Penalized Quantile Regression with some nonpenalized
###   coefficients with QICD Algorithm
### Aliases: QICD.nonpen

### ** Examples

library(splines)
n = 50
p = 100
x <- matrix(rnorm(n*p), nrow=n)
z1 <- runif(n)
z2 <- runif(n)
z <- cbind(bs(z1), bs(z2))
y <- 0 + x[,1] - 3*x[,5] + z1^3 + sin(2*pi*z2) + rnorm(n)
fit1 <- QICD.nonpen(y,x,z, tau=.5, lambda=1, intercept=TRUE, penalty="SCAD")
fit2 <- QICD.nonpen(y,x,z, tau=.7, lambda=1, intercept=TRUE, penalty="SCAD")



