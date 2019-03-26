library(GaussianHMM1d)


### Name: EstHMM1d
### Title: Estimation of a univariate Gaussian Hidden Markov Model (HMM)
### Aliases: EstHMM1d

### ** Examples

Q <- matrix(c(0.8, 0.3, 0.2, 0.7),2,2); mu <- c(-0.3 ,0.7) ; sigma <- c(0.15,0.05)
data <- Sim.HMM.Gaussian.1d(mu,sigma,Q,eta0=1,100)$x
est <- EstHMM1d(data, 2, max_iter=10000, prec=0.0001)




