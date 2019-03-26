library(GaussianHMM1d)


### Name: Sim.HMM.Gaussian.1d
### Title: Simulation of a univariate Gaussian Hidden Markov Model (HMM)
### Aliases: Sim.HMM.Gaussian.1d

### ** Examples

Q <- matrix(c(0.8, 0.3, 0.2, 0.7),2,2) ; mu <- c(-0.3 ,0.7) ; sigma <- c(0.15,0.05);
sim <- Sim.HMM.Gaussian.1d(mu,sigma,Q,eta0=1,n=100)




