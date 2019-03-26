library(winRatioAnalysis)


### Name: winRatio
### Title: Analyze the winRatio as a function of time
### Aliases: winRatio
### Keywords: htest survival nonparametric

### ** Examples


winRatio(Surv(tdeath,cdeath),
treatmentVariable='rx', treatmentCodes = c(1, 0),data=dat,
secondSurvivalObject=Surv(tprog0,tprog1,type='interval'),pssmIntervals=1,
method = "pssm", plotPoints =3, integrationIntervals=1)

winRatio(Surv(tdeath,cdeath),
treatmentVariable='rx', treatmentCodes = c(1, 0),data=dat,
secondSurvivalObject=Surv(tprogression,cprog),
method = "NP", plotPoints =3)


## Not run: 
##D winRatio(Surv(surv,csurv),
##D longitudinalVariable = "ALSFRS",
##D timeVar="times",subject="subjects",
##D treatmentVariable='trt',
##D treatmentCodes = c(0, 1),data=als,method = "NP",
##D nominalTimes=c(0,6,12),
##D plotPoints =6,mult=1)
##D #          time firstP10 firstP01 secondP10 secondP01 winRatio WinRatioSE
##D #Value 11.93747  0.24500 0.313125  0.199375  0.242500 1.250352  0.3007245
##D #plots  6.00100  0.49375 0.468750  0.160625  0.200625 1.022923         NA
## End(Not run)



