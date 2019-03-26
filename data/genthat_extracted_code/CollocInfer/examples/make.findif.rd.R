library(CollocInfer)


### Name: make.findif
### Title: Finite Difference Functions
### Aliases: make.findif make.findif.ode make.findif.loglik make.findif.var

### ** Examples


# Sum of squared errors with finite differencing to get right-hand-side derivatives

proc = make.SSEproc()
proc$more = make.findif.ode()


# Finite differencing for the log likelihood

lik = make.findif.loglik()
lik$more = make.SSElik()


# Multivariate normal transitions with finite differencing for mean and variance functions

lik = make.multinorm()
lik$more = c(make.findif.ode,make.findif.var)

# Finite differencing for transition density of a discrete time system

proc = make.Dproc()
proc$more = make.findif.loglik()




