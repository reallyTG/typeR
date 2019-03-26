library(braidrm)


### Name: hillConcCorrect
### Title: Hill-Based Concentration Correction
### Aliases: hillConcCorrect
### Keywords: regression

### ** Examples

data(es8olatmz)
drv <- es8olatmz$compound2=="DMSO"
hfit <- findBestHill(act~conc1,es8olatmz[drv,],defaults=c(0,-2.7))
drvpos <- drv & es8olatmz$conc1>0
cconc <- hillConcCorrect(es8olatmz$conc1[drvpos],es8olatmz$act[drvpos],
			coef(hfit$allfits[[hfit$bestModIdx]]),sigr=1)



