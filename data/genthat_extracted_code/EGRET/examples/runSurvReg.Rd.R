library(EGRET)


### Name: runSurvReg
### Title: Run the weighted survival regression for a set of estimation
###   points (defined by DecYear and Log(Q))
### Aliases: runSurvReg run_WRTDS
### Keywords: statistics water-quality

### ** Examples

eList <- Choptank_eList
estPtYear<-c(2001.0,2005.0,2009.0)
estPtLQ<-c(1,1,1)
Sample <- getSample(eList)
DecLow <- Sample$DecYear[1]
DecHigh <- Sample$DecYear[nrow(Sample)]
resultSurvReg <- runSurvReg(estPtYear,estPtLQ,
                            DecLow,DecHigh,Sample,
                            run.parallel = FALSE)



