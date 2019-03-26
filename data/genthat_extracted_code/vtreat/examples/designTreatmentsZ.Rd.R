library(vtreat)


### Name: designTreatmentsZ
### Title: Design variable treatments with no outcome variable.
### Aliases: designTreatmentsZ

### ** Examples


dTrainZ <- data.frame(x=c('a','a','a','a','b','b',NA,'e','e'),
    z=c(1,2,3,4,5,6,7,NA,9))
dTestZ <- data.frame(x=c('a','x','c',NA),
    z=c(10,20,30,NA))
treatmentsZ = designTreatmentsZ(dTrainZ, colnames(dTrainZ),
  rareCount=0)
dTrainZTreated <- prepare(treatmentsZ, dTrainZ)
dTestZTreated <- prepare(treatmentsZ, dTestZ)




