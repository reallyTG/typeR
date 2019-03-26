library(relSim)


### Name: lrSibDebug
### Title: Likelihood Ratio / Kinship Index for full-siblings
### Aliases: lrSibDebug

### ** Examples


data(fbiCaucs)
P1 = randomProfile(fbiCaucs)
S1 = randomSib(P1, fbiCaucs)
P2 = randomProfile(fbiCaucs)
cat(paste(lrSibDebug(P1, S1, fbiCaucs)$Lines))
cat(paste(lrSibDebug(P1, P2, fbiCaucs)$Lines))




