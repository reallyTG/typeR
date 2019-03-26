library(relSim)


### Name: lrSib
### Title: Likelihood Ratio / Kinship Index for full-siblings
### Aliases: lrSib

### ** Examples


data(fbiCaucs)
P1 = randomProfile(fbiCaucs)
S1 = randomSib(P1, fbiCaucs)
P2 = randomProfile(fbiCaucs)
lrSib(P1, S1, fbiCaucs)
lrSib(P1, P2, fbiCaucs)




