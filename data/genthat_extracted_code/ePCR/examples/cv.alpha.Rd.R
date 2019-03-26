library(ePCR)


### Name: cv.alpha
### Title: Cross-validation runs for risk predition at a single value of
###   alpha
### Aliases: cv.alpha

### ** Examples

data(TYKSSIMU)
library(survival)
ydat <- Surv(event = yMEDISIMU[,"DEATH"], time = yMEDISIMU[,"LKADT_P"])
set.seed(1)
cvs <- cv.alpha(x = xMEDISIMU, y = ydat, alpha = 0.5, folds = 5, 
	nlamb = 50, verb = 1, scorefunc = score.cindex, plot = TRUE)
cvs



