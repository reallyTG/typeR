library(RegSDC)


### Name: RegSDCgen
### Title: Regression-based SDC Tools - General data generation
### Aliases: RegSDCgen
### Keywords: internal

### ** Examples

exY <- matrix(rnorm(15), 5, 3)
RegSDCgen(exY)
RegSDCgen(exY, yNew = exY + 0.001 * matrix(rnorm(15), 5, 3))  # Close to exY
RegSDCgen(exY, lambda = 0.001)  # Close to exY



