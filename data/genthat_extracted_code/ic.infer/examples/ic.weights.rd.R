library(ic.infer)


### Name: ic.weights
### Title: functions for calculating the distributions of normal
###   distribution order-related likelihood ratio tests
### Aliases: ic.weights pbetabar pchibar
### Keywords: multivariate

### ** Examples

z <- 0.5
corr <- matrix(c(1,0.9,0.9,1),2,2)
print(wt.plus <- ic.weights(corr))
T <- c(z,z)%*%solve(corr,c(z,z))
1-pchibar(T,2:0,wt.plus)
1-pbetabar(T/(T+10),2:0,10,wt.plus)
corr <- matrix(c(1,0,0,1),2,2)
print(wt.0 <- ic.weights(corr))
T <- c(z,z)%*%solve(corr,c(z,z))
1-pchibar(T,2:0,wt.0)
1-pbetabar(T/(T+10),2:0,10,wt.0)
corr <- matrix(c(1,-0.9,-0.9,1),2,2)
print(wt.minus <- ic.weights(corr))
T <- c(z,z)%*%solve(corr,c(z,z))
1-pchibar(T,2:0,wt.minus)
1-pbetabar(T/(T+10),2:0,10,wt.minus)



