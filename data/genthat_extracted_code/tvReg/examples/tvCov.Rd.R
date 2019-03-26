library(tvReg)


### Name: tvCov
### Title: Time-varying Variance-Covariance Estimation
### Aliases: tvCov

### ** Examples

##Generate two independent (uncorrelated series)
y <- cbind(rnorm(100, sd = 4), rnorm(100, sd = 1))

##Estimation variance-variance matrix. If the bandwidth is unknown, it can
##calculated with function bwCov()
Sigma.hat <-  tvCov(y, bw = 1.4)

##The first time estimate
print(Sigma.hat[,,1])
##The mean over time of all estimates
print(apply(Sigma.hat, 1:2, mean))
##Generate two dependent variables
y <- MASS::mvrnorm(n = 100, mu = c(0,0), Sigma = cbind(c(1, -0.5), c(-0.5, 4)))

##Estimation variance-variance matrix
Sigma.hat <-  tvCov(y, bw = 3.2)
##The first time estimate
print(Sigma.hat[,,1])




