library(epimdr)


### Name: seirmod2
### Title: Gradient-function for the forced SEIR model
### Aliases: seirmod2

### ** Examples

require(deSolve)
times  = seq(0, 10, by=1/120)
paras  = c(mu = 1/50, N = 1, beta0 = 1000, beta1 = 0.2, sigma = 365/8, gamma = 365/5)
start = c(S=0.06, E=0, I=0.001, R = 0.939)
out=ode(y=start, times=times, func=seirmod2, parms=paras)



