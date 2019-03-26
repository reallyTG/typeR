library(epimdr)


### Name: coyne
### Title: Gradient-function for Coyne et al's rabies model
### Aliases: coyne

### ** Examples

require(deSolve)
times  = seq(0, 50, by=1/520)
paras  = c(gamma = 0.0397, b = 0.836, a = 1.34, sigma = 7.5, 
alpha = 66.36, beta = 33.25, c = 0, rho = 0.8)
start = log(c(X=12.69/2, H1=0.1, H2=0.1, Y = 0.1, I = 0.1))
out = as.data.frame(ode(start, times, coyne, paras))



