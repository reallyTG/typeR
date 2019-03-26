library(primer)


### Name: compcol
### Title: Two-species Competition-colonization Metapopulation Model
### Aliases: compcol
### Keywords: methods

### ** Examples

library(deSolve)
pars <- c(c1 = .3, c2 = 1, m1 = .1, m2 = .1)
pops <- c(.1,.1)
out <- ode(y=pops, t=0:20, fun=compcol, parms = pars)
matplot(out[,1], out[,-1], type='l')



