library(ePCR)


### Name: cv.grid
### Title: Cross-validation runs for risk predition for a grid of
###   predetermined alpha values and their conditional lambda values
### Aliases: cv.grid

### ** Examples

data(TYKSSIMU)
library(survival)
ydat <- Surv(event = yMEDISIMU[,"DEATH"], time = yMEDISIMU[,"LKADT_P"])
cvs <- cv.grid(x = xMEDISIMU, y = ydat, folds = 3, nlamb = 30, alphaseq = seq(0, 1, by=5), 
	scorefunc = score.iAUC, plot = TRUE, seed = 1)
cvs



