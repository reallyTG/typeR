library(flexsurv)


### Name: totlos.fs
### Title: Total length of stay in particular states for a
###   fully-parametric, time-inhomogeneous Markov multi-state model
### Aliases: totlos.fs
### Keywords: models,survival

### ** Examples


# BOS example in vignette, and in msfit.flexsurvreg
bexp <- flexsurvreg(Surv(Tstart, Tstop, status) ~ trans,
                    data=bosms3, dist="exp")
tmat <- rbind(c(NA,1,2),c(NA,NA,3),c(NA,NA,NA))

# predict 4 years spent without BOS, 3 years with BOS, before death
# As t increases, this should converge

totlos.fs(bexp, t=10, trans=tmat)
totlos.fs(bexp, t=1000, trans=tmat)
totlos.fs(bexp, t=c(5,10), trans=tmat)

# Answers should match results in help(totlos.simfs) up to Monte Carlo
# error there / ODE solving precision here, since with an exponential
# distribution, the "semi-Markov" model there is the same as the Markov
# model here



