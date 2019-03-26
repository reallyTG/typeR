library(rPowerSampleSize)


### Name: global.1m.ssc
### Title: Sample Size Computation Based on a Global Procedure in the
###   Context of Multiple Continuous Endpoints
### Aliases: global.1m.ssc
### Keywords: package multivariate models multiple testing sample size
###   computation

### ** Examples

# Sample size computation for the global method 
global.1m.ssc(method = "Adj.Model", mean.diff = c(0.1, 0.2, 0.3), sd =
c(1, 1, 1), cor = diag(1, 3), v = -0.2, M = 0.46)

# Table 2 in our 2014 paper:
Sigma2 <- matrix(c(5.58, 2, 1.24, 2, 4.29, 1.59, 1.24, 1.59, 4.09), ncol = 3)
sd2 <- sqrt(diag(Sigma2))
cor2 <- diag(1 / sd2) %*% Sigma2 %*% diag(1 / sd2)
mu2 <- c(0.35, 0.28, 0.46)
m <- 3
global.1m.ssc(method = "Model", mean.diff = mu2, sd = sd2, cor = cor2)



