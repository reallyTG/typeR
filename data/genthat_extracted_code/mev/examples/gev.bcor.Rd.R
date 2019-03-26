library(mev)


### Name: gev.bcor
### Title: Bias correction for GEV distribution using Firth's modified
###   score function or bias substraction
### Aliases: gev.bcor

### ** Examples

set.seed(1)
dat <- evd::rgev(n=40, loc = 1, scale=1, shape=-0.2)
par <- evd::fgev(dat)$estimate
gev.bcor(par,dat, "subtract")
gev.bcor(par,dat, "firth") #observed information
gev.bcor(par,dat, "firth","exp")



