library(vtreat)


### Name: designTreatmentsC
### Title: Build all treatments for a data frame to predict a categorical
###   outcome.
### Aliases: designTreatmentsC

### ** Examples


dTrainC <- data.frame(x=c('a','a','a','b','b','b'),
   z=c(1,2,3,4,5,6),
   y=c(FALSE,FALSE,TRUE,FALSE,TRUE,TRUE))
dTestC <- data.frame(x=c('a','b','c',NA),
   z=c(10,20,30,NA))
treatmentsC <- designTreatmentsC(dTrainC,colnames(dTrainC),'y',TRUE)
dTrainCTreated <- prepare(treatmentsC,dTrainC,pruneSig=0.99)
dTestCTreated <- prepare(treatmentsC,dTestC,pruneSig=0.99)




