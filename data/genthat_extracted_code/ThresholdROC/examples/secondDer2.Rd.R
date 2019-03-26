library(ThresholdROC)


### Name: secondDer2
### Title: Second partial derivative of the cost function (two-state
###   setting)
### Aliases: secondDer2
### Keywords: derivative threshold

### ** Examples

n1 <- 100
n2 <- 100
set.seed(1234)
par1.1 <- 0
par1.2 <- 1
par2.1 <- 2
par2.2 <- 1
rho <- 0.2
k1 <- rnorm(n1, par1.1, par1.2) # non-diseased
k2 <- rnorm(n2, par2.1, par2.2) # diseased
x <- thres2(k1, k2, rho, method="equal", ci.method="delta")
secondDer2(x)



