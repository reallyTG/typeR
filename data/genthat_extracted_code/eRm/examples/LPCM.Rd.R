library(eRm)


### Name: LPCM
### Title: Estimation of linear partial credit models
### Aliases: LPCM
### Keywords: models

### ** Examples

#LPCM for two measurement points and two subject groups
#20 subjects, 2*3 items
G <- c(rep(1,10),rep(2,10))                   #group vector
res <- LPCM(lpcmdat, mpoints = 2, groupvec = G)
res
summary(res)



