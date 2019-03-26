library(epimdr)


### Name: sirwmod
### Title: Gradient-function for the SIRWS model
### Aliases: sirwmod

### ** Examples

require(deSolve)
times  = seq(0, 26, by=1/10)
paras  = c(mu = 1/70, p=0.2, N = 1, beta = 200, omega = 1/10, gamma = 17, kappa=30)
start = log(c(S=0.06, I=0.01, R=0.92, W = 0.01))
out = as.data.frame(ode(start, times, sirwmod, paras))



