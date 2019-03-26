library(flexsurv)


### Name: pmatrix.fs
### Title: Transition probability matrix from a fully-parametric,
###   time-inhomogeneous Markov multi-state model
### Aliases: pmatrix.fs
### Keywords: models,survival

### ** Examples


# BOS example in vignette, and in msfit.flexsurvreg
bexp <- flexsurvreg(Surv(Tstart, Tstop, status) ~ trans,
                    data=bosms3, dist="exp")
tmat <- rbind(c(NA,1,2),c(NA,NA,3),c(NA,NA,NA))
# more likely to be dead (state 3) as time moves on, or if start with
# BOS (state 2)
pmatrix.fs(bexp, t=c(5,10), trans=tmat)



