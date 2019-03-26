library(eRm)


### Name: LRSM
### Title: Estimation of linear rating scale models
### Aliases: LRSM
### Keywords: models

### ** Examples

#LRSM for two measurement points
#20 subjects, 2*3 items, W generated automatically,
#first parameter set to 0, no standard errors computed.

res <- LRSM(lrsmdat, mpoints = 2, groupvec = 1, sum0 = FALSE, se = FALSE)
res



