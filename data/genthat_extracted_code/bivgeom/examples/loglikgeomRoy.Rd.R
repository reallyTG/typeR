library(bivgeom)


### Name: loglikgeomRoy
### Title: Log-likelihood function
### Aliases: loglikgeomRoy
### Keywords: distribution htest

### ** Examples

theta1 <- 0.5
theta2 <- 0.7
theta3 <- 0.9
# random sample of size n=1000:
set.seed(12345)
n <- 1000
d <- rbivgeomRoy(n, theta1, theta2, theta3)
# parameter estimation, using the different proposed methods:
hattheta <- estbivgeomRoy(d[,1], d[,2], "ML")
loglikgeomRoy(hattheta, x=d[,1], y=d[,2])
# negative value of the (maximized) log-likelihood function



