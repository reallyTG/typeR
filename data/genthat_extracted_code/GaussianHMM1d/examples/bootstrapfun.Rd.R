library(GaussianHMM1d)


### Name: bootstrapfun
### Title: Function to perform parametric bootstrap
### Aliases: bootstrapfun
### Keywords: internal

### ** Examples

mu <- c(-0.3 ,0.7) ; sigma <- c(0.15,0.05); Q <- matrix(c(0.8, 0.3, 0.2, 0.7),2,2) ;
data <- Sim.HMM.Gaussian.1d(mu,sigma,Q,eta0=1,100)$x
out <- bootstrapfun(mu,sigma,Q,max_iter=10000,prec=0.0001,n=100)




