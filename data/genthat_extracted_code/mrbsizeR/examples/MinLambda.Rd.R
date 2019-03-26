library(mrbsizeR)


### Name: MinLambda
### Title: Numerical optimization for finding appropriate smoothing levels.
### Aliases: MinLambda

### ** Examples

# Artificial sample data
set.seed(987)
sampleData <- matrix(stats::rnorm(100), nrow = 10)
sampleData[4:6, 6:8] <- sampleData[4:6, 6:8] + 5

# Minimization of two lambdas on a 20-by-20-grid
minlamOut <- MinLambda(Xmu = c(sampleData), mm = 10, nn = 10, 
                       nGrid = 20, nLambda = 2)

# Minimal lambda values
minlamOut$lambda[minlamOut$minind]




