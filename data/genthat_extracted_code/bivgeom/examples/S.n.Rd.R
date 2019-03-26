library(bivgeom)


### Name: S.n
### Title: Empirical joint survival function
### Aliases: S.n
### Keywords: distribution nonparametric

### ** Examples

theta1 <- 0.5
theta2 <- 0.7
theta3 <- 0.9
set.seed(12345)
n <- 1000
d <- rbivgeomRoy(n, theta1, theta2, theta3)
S.n(cbind(1,1),d) # empirical sf
# compare it with the theoretical
SbivgeomRoy(1,1,theta1,theta2,theta3)



