library(cNORM)


### Name: plotDerivative
### Title: Plot first order derivative of regression model
### Aliases: plotDerivative

### ** Examples

# Load example data set, compute model and plot results
normData <- prepareData()
m <- bestModel(data = normData)
plotDerivative(m, minAge=2, maxAge=5, step=.2, minNorm=25, maxNorm=75, stepNorm=1)



