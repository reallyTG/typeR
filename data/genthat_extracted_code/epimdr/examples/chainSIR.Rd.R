library(epimdr)


### Name: chainSIR
### Title: Gradient-function for the chain-SIR model
### Aliases: chainSIR

### ** Examples

require(deSolve)
times  = seq(0, 10, by=1/52)
paras2  = c(mu = 1/75, N = 1, beta =  625, gamma = 365/14, u=5)
xstart2 = log(c(S=.06, I=c(0.001, rep(0.0001, paras2["u"]-1)), R = 0.0001))
out = as.data.frame(ode(xstart2, times, chainSIR, paras2))



