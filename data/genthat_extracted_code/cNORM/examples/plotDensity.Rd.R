library(cNORM)


### Name: plotDensity
### Title: Plot the density function per group by raw score
### Aliases: plotDensity

### ** Examples

# Load example data set, compute model and plot results for age values 2, 4 and 6
normData <- prepareData()
m <- bestModel(data = normData)
plotDensity(m, group = c (2, 4, 6))



