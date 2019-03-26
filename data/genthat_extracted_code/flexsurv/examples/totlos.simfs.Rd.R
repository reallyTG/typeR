library(flexsurv)


### Name: totlos.simfs
### Title: Expected total length of stay in specific states, from a
###   fully-parametric, semi-Markov multi-state model
### Aliases: totlos.simfs
### Keywords: models,survival

### ** Examples


# BOS example in vignette, and in msfit.flexsurvreg
bexp <- flexsurvreg(Surv(years, status) ~ trans, data=bosms3, dist="exp")
tmat <- rbind(c(NA,1,2),c(NA,NA,3),c(NA,NA,NA))

# predict 4 years spent without BOS, 3 years with BOS, before death
# As t increases, this should converge
totlos.simfs(bexp, t=10, trans=tmat)
totlos.simfs(bexp, t=1000, trans=tmat)



