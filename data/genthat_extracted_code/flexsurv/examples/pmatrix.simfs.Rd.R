library(flexsurv)


### Name: pmatrix.simfs
### Title: Transition probability matrix from a fully-parametric,
###   semi-Markov multi-state model
### Aliases: pmatrix.simfs
### Keywords: models,survival

### ** Examples


# BOS example in vignette, and in msfit.flexsurvreg

bexp <- flexsurvreg(Surv(years, status) ~ trans, data=bosms3, dist="exp")
tmat <- rbind(c(NA,1,2),c(NA,NA,3),c(NA,NA,NA))

# more likely to be dead (state 3) as time moves on, or if start with
# BOS (state 2)

pmatrix.simfs(bexp, t=5, trans=tmat)
pmatrix.simfs(bexp, t=10, trans=tmat)

# these results should converge to those in help(pmatrix.fs), as M
# increases here and ODE solving precision increases there, since with
# an exponential distribution, the semi-Markov model is the same as the
# Markov model.



