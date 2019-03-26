library(GaussianHMM1d)


### Name: em.step
### Title: Function to perform the E-M steps for the estimation of the
###   paramters
### Aliases: em.step

### ** Examples

mu <- c(-0.3 ,0.7) ; sigma <- c(0.15,0.05); Q <- matrix(c(0.8, 0.3, 0.2, 0.7),2,2) ;
data <- Sim.HMM.Gaussian.1d(mu,sigma,Q,eta0=1,100)$x
out <- em.step(data,mu,sigma,Q)



