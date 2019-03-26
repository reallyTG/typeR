library(bivgeom)


### Name: estbivgeomRoy
### Title: Parameter estimation
### Aliases: estbivgeomRoy
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
hattheta # MLEs
estbivgeomRoy(d[,1], d[,2], "LS")
estbivgeomRoy(d[,1], d[,2], "MMP")



