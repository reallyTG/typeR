library(cNORM)


### Name: plotNormCurves
### Title: Plot norm curves
### Aliases: plotNormCurves

### ** Examples

# Load example data set, compute model and plot results
normData <- prepareData()
m <- bestModel(data = normData)
plotNormCurves(m, minAge=2, maxAge=5)



