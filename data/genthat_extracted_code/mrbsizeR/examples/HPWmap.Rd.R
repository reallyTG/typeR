library(mrbsizeR)


### Name: HPWmap
### Title: Computation of pointwise and highest pointwise probabilities.
### Aliases: HPWmap

### ** Examples

# Artificial sample data: 10 observations (5-by-2 object), 10 samples
set.seed(987)
sampleData <- matrix(stats::rnorm(100), nrow = 10)
sampleData[4:6, ] <- sampleData[4:6, ] + 5

# Calculation of the simultaneous credible intervals
HPWmap(smoothVec = sampleData, mm = 5, nn = 2, prob = 0.95)




