library(clusternomics)


### Name: generateTestData_2D
### Title: Generate simulated 2D dataset for testing
### Aliases: generateTestData_2D

### ** Examples

groupCounts <- c(50, 10, 40, 60)
means <- c(-1.5,1.5)
testData <- generateTestData_1D(groupCounts, means)
# Use the dataset as an input for the contextCluster function for testing
datasets <- testData$data




