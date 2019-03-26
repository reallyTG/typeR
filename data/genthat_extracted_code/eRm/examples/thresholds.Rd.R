library(eRm)


### Name: thresholds
### Title: Computation of item-category treshold parameters.
### Aliases: thresholds thresholds.eRm print.threshold summary.threshold
###   confint.threshold
### Keywords: models

### ** Examples

#Threshold parameterization for a rating scale model
res <- RSM(rsmdat)
th.res <- thresholds(res)
th.res
confint(th.res)
summary(th.res)

#Threshold parameters for a PCM with ICC plot
res <- PCM(pcmdat)
th.res <- thresholds(res)
th.res
plotICC(res)

#Threshold parameters for a LPCM:
#Block 1: t1, g1; Block 2: t1, g2; ...; Block 6: t2,g3
G <- c(rep(1,7),rep(2,7),rep(3,6)) # group vector for 3 groups
res <- LPCM(lpcmdat, mpoints = 2, groupvec = G)
th.res <- thresholds(res)
th.res



