library(trajr)


### Name: TrajFractalDimensionValues
### Title: Fractal dimension calculation
### Aliases: TrajFractalDimensionValues

### ** Examples

set.seed(42)
trj <- TrajGenerate()
muL <- mean(TrajStepLengths(trj))
# Use 20 step sizes from 1/2 mean step length to 5 * mean step length.
# For real use, biologically meaningful step sizes should be used.
stepSizes <- TrajLogSequence(0.5 * muL, 5 * muL, 20)
plot(TrajFractalDimensionValues(trj, stepSizes), log = "xy", pch = 16, cex = .5)




