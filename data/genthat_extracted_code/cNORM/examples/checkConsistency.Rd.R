library(cNORM)


### Name: checkConsistency
### Title: Check the consistency of the norm data model
### Aliases: checkConsistency

### ** Examples

normData <- prepareData()
m <- bestModel(normData)
modelViolations <- checkConsistency(m, minAge=2, maxAge=5, stepAge=0.1,
                   minNorm=25, maxNorm=75, minRaw=0, maxRaw= 28, stepNorm=1)
plotDerivative(m, , minAge=2, maxAge=5, minNorm=25, maxNorm=75)



