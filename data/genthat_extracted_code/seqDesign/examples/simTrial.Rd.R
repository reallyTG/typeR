library(seqDesign)


### Name: simTrial
### Title: Simulation of Multi-Arm Randomized Phase IIb/III Efficacy Trials
###   with Time-to-Event Endpoints
### Aliases: simTrial

### ** Examples

simData <- simTrial(N=c(1000, rep(700, 2)), aveVE=seq(0, 0.4, by=0.2), 
                    VEmodel="half", vePeriods=c(1, 27, 79), enrollPeriod=78, 
                    enrollPartial=13, enrollPartialRelRate=0.5, dropoutRate=0.05, 
                    infecRate=0.04, fuTime=156, 
                    visitSchedule=c(0, (13/3)*(1:4), seq(13*6/3, 156, by=13*2/3)),
                    missVaccProb=c(0,0.05,0.1,0.15), VEcutoffWeek=26, nTrials=5, 
                    blockSize=30, stage1=78, randomSeed=300)

### alternatively, to save the .RData output file (no '<-' needed):
###
### simTrial(N=c(1400, rep(1000, 2)), aveVE=seq(0, 0.4, by=0.2), VEmodel="half", 
###          vePeriods=c(1, 27, 79), enrollPeriod=78, enrollPartial=13, 
###          enrollPartialRelRate=0.5, dropoutRate=0.05, infecRate=0.04, fuTime=156, 
###          visitSchedule=c(0, (13/3)*(1:4), seq(13*6/3, 156, by=13*2/3)), 
###          missVaccProb=c(0,0.05,0.1,0.15), VEcutoffWeek=26, nTrials=30, 
###          blockSize=30, stage1=78, saveDir="./", randomSeed=300)



