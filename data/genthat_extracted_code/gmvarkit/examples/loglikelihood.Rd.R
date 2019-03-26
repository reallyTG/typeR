library(gmvarkit)


### Name: loglikelihood
### Title: Compute log-likelihood of GMVAR model using parameter vector
### Aliases: loglikelihood

### ** Examples

data <- cbind(10*eurusd[,1], 100*eurusd[,2])
params222 <- c(-11.904, 154.684, 1.314, 0.145, 0.094, 1.292, -0.389,
 -0.070, -0.109, -0.281, 0.920, -0.025, 4.839, 11.633, 124.983, 1.248,
  0.077, -0.040, 1.266, -0.272, -0.074, 0.034, -0.313, 5.855, 3.570,
  9.838, 0.740)
loglikelihood(data=data, p=2, M=2, params=params222, parametrization="mean")



