library(seqDesign)


### Name: rankTrial
### Title: Ranking and Selection, and Head-to-Head Comparison of Individual
###   and Pooled Treatment Arms
### Aliases: rankTrial

### ** Examples

simData <- simTrial(N=c(1000, rep(700, 2)), aveVE=seq(0, 0.4, by=0.2), 
                    VEmodel="half", vePeriods=c(1, 27, 79), enrollPeriod=78, 
                    enrollPartial=13, enrollPartialRelRate=0.5, dropoutRate=0.05, 
                    infecRate=0.04, fuTime=156, 
                    visitSchedule=c(0, (13/3)*(1:4), seq(13*6/3, 156, by=13*2/3)),
                    missVaccProb=c(0,0.05,0.1,0.15), VEcutoffWeek=26, nTrials=5, 
                    stage1=78, randomSeed=300)
                    
monitorData <- monitorTrial(dataFile=simData, stage1=78, stage2=156, 
                            harmMonitorRange=c(10,100), alphaPerTest=0.0106, 
                            minCnt=50, minPct=0.33, week1=26, minCnt2=2, week2=52, 
                            nonEffInterval=20, lowerVEnoneff=0, upperVEnoneff=0.4, 
                            highVE=0.7, stage1VE=0, lowerVEuncPower=0, 
                            alphaNoneff=0.05, alphaHigh=0.05, alphaStage1=0.05, 
                            alphaUncPower=0.05, estimand="cuminc", VEcutoffWeek=26)
                            
censData <- censTrial(dataFile=simData, monitorFile=monitorData, stage1=78, 
                      stage2=156)
                      
rankData <- rankTrial(censFile=censData, idxHighestVE=2, 
                      headHead=matrix(2:1, nrow=1, ncol=2), lowerVE=0, stage1=78, 
                      stage2=156, alpha=0.05)

### alternatively, to save the .RData output file (no '<-' needed):
###
### simTrial(N=c(1400, rep(1000, 2)), aveVE=seq(0, 0.4, by=0.2), VEmodel="half", 
###          vePeriods=c(1, 27, 79), enrollPeriod=78, enrollPartial=13, 
###          enrollPartialRelRate=0.5, dropoutRate=0.05, infecRate=0.04, fuTime=156, 
###          visitSchedule=c(0, (13/3)*(1:4), seq(13*6/3, 156, by=13*2/3)), 
###          missVaccProb=c(0,0.05,0.1,0.15), VEcutoffWeek=26, nTrials=30, 
###          stage1=78, saveDir="./", randomSeed=300)
###
### monitorTrial(dataFile=
###          "simTrial_nPlac=1400_nVacc=1000_1000_aveVE=0.2_0.4_infRate=0.04.RData", 
###          stage1=78, stage2=156, harmMonitorRange=c(10,100), alphaPerTest=0.0106, 
###          minCnt=50, minPct=0.33, week1=26, minCnt2=2, week2=52, nonEffInterval=20, 
###          lowerVEnoneff=0, upperVEnoneff=0.4, highVE=0.7, stage1VE=0, 
###          lowerVEuncPower=0, alphaNoneff=0.05, alphaHigh=0.05, alphaStage1=0.05, 
###          alphaUncPower=0.05, estimand="cuminc", VEcutoffWeek=26, saveDir="./")
###
### censTrial(dataFile=
###  "simTrial_nPlac=1400_nVacc=1000_1000_aveVE=0.2_0.4_infRate=0.04.RData",
###  monitorFile=
###  "monitorTrial_nPlac=1400_nVacc=1000_1000_aveVE=0.2_0.4_infRate=0.04_cuminc.RData",
###  stage1=78, stage2=156, saveDir="./")
###
### rankTrial(censFile=
###  "trialDataCens_nPlac=1400_nVacc=1000_1000_aveVE=0.2_0.4_infRate=0.04_cuminc.RData",
###  idxHighestVE=2, headHead=matrix(2:1, nrow=1, ncol=2), lowerVE=0, stage1=78, 
###  stage2=156, alpha=0.05, saveDir="./")



