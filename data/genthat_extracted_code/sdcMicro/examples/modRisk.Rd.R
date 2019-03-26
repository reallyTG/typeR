library(sdcMicro)


### Name: modRisk
### Title: Global risk using log-linear models.
### Aliases: modRisk
### Keywords: manip

### ** Examples

## data.frame method
data(testdata2)
form <- ~sex+water+roof
w <- "sampling_weight"
(modRisk(testdata2, method="default", formulaM=form, weights=w))
(modRisk(testdata2, method="CE", formulaM=form, weights=w))
(modRisk(testdata2, method="PML", formulaM=form, weights=w))
(modRisk(testdata2, method="weightedLLM", formulaM=form, weights=w))
(modRisk(testdata2, method="IPF", formulaM=form, weights=w))

## application to a sdcMicroObj
data(testdata2)
sdc <- createSdcObj(testdata2,
 keyVars=c('urbrur','roof','walls','electcon','relat','sex'),
 numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- modRisk(sdc,form=~sex+water+roof)
slot(sdc, "risk")$model



