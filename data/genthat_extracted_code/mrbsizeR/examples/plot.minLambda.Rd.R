library(mrbsizeR)


### Name: plot.minLambda
### Title: Plot of objective function for finding appropriate smoothing
###   parameters.
### Aliases: plot.minLambda

### ** Examples

set.seed(987)
sampleData <- matrix(stats::rnorm(100), nrow = 10)
sampleData[4:6, 6:8] <- sampleData[4:6, 6:8] + 5

# Minimization of two lambdas on a 20-by-20-grid
minLamOut <- MinLambda(Xmu = c(sampleData), mm = 10, nn = 10, 
                        nGrid = 20, nLambda = 3)

# Plot of the objective function
plot(x = minLamOut)




