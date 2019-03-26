library(vtreat)


### Name: prepare.treatmentplan
### Title: Apply treatments and restrict to useful variables.
### Aliases: prepare.treatmentplan

### ** Examples


dTrainN <- data.frame(x= c('a','a','a','a','b','b','b'),
                      z= c(1,2,3,4,5,6,7),
                      y= c(0,0,0,1,0,1,1))
dTestN <- data.frame(x= c('a','b','c',NA),
                     z= c(10,20,30,NA))
treatmentsN = designTreatmentsN(dTrainN,colnames(dTrainN), 'y')
dTrainNTreated <- prepare(treatmentsN, dTrainN, pruneSig= 0.2)
dTestNTreated <- prepare(treatmentsN, dTestN, pruneSig= 0.2)

dTrainC <- data.frame(x= c('a','a','a','b','b','b'),
                      z= c(1,2,3,4,5,6),
                      y= c(FALSE,FALSE,TRUE,FALSE,TRUE,TRUE))
dTestC <- data.frame(x= c('a','b','c',NA),
                     z= c(10,20,30,NA))
treatmentsC <- designTreatmentsC(dTrainC, colnames(dTrainC),'y',TRUE)
dTrainCTreated <- prepare(treatmentsC, dTrainC)
dTestCTreated <- prepare(treatmentsC, dTestC)

dTrainZ <- data.frame(x= c('a','a','a','b','b','b'),
                      z= c(1,2,3,4,5,6))
dTestZ <- data.frame(x= c('a','b','c',NA),
                     z= c(10,20,30,NA))
treatmentsZ <- designTreatmentsZ(dTrainZ, colnames(dTrainZ))
dTrainZTreated <- prepare(treatmentsZ, dTrainZ, codeRestriction= c('lev'))
dTestZTreated <- prepare(treatmentsZ, dTestZ, codeRestriction= c('lev'))




