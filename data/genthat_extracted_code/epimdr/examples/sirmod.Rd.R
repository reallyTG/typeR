library(epimdr)


### Name: sirmod
### Title: Gradient-function for the SIR model
### Aliases: sirmod

### ** Examples

require(deSolve)
times  = seq(0, 26, by=1/10)
paras  = c(mu = 0, N = 1, beta =  2, gamma = 1/2)
start = c(S=0.999, I=0.001, R = 0)
out=ode(y=start, times=times, func=sirmod, parms=paras)



