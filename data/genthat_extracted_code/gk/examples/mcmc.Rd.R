library(gk)


### Name: mcmc
### Title: Markov chain Monte Carlo inference
### Aliases: mcmc

### ** Examples

set.seed(1)
x = rgk(10, A=3, B=1, g=2, k=0.5) ##An unusually small dataset for fast execution of this example
out = mcmc(x, N=1000, theta0=c(mean(x),sd(x),0,0), Sigma0=0.1*diag(4))



