library(gk)


### Name: fdsa
### Title: Finite difference stochastic approximation inference
### Aliases: fdsa

### ** Examples

set.seed(1)
x = rgk(10, A=3, B=1, g=2, k=0.5) ##An unusually small dataset for fast execution of this example
out = fdsa(x, N=100, theta0=c(mean(x),sd(x),0,0), theta_min=c(-5,1E-5,-5,0), theta_max=c(5,5,5,5))



