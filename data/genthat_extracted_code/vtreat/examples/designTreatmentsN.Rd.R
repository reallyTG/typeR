library(vtreat)


### Name: designTreatmentsN
### Title: build all treatments for a data frame to predict a numeric
###   outcome
### Aliases: designTreatmentsN

### ** Examples


dTrainN <- data.frame(x=c('a','a','a','a','b','b','b'),
    z=c(1,2,3,4,5,6,7),y=c(0,0,0,1,0,1,1))
dTestN <- data.frame(x=c('a','b','c',NA),
    z=c(10,20,30,NA))
treatmentsN = designTreatmentsN(dTrainN,colnames(dTrainN),'y')
dTrainNTreated <- prepare(treatmentsN,dTrainN,pruneSig=0.99)
dTestNTreated <- prepare(treatmentsN,dTestN,pruneSig=0.99)




