library(relSim)


### Name: IBS
### Title: Identity by state
### Aliases: IBS

### ** Examples


data(fbiCaucs)
P1 = randomProfile(fbiCaucs)
C1 = randomChild(P1, fbiCaucs)
IBS(P1, C1)
IBS(P1, C1, bPrint = TRUE)




