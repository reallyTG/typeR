library(rcompanion)


### Name: nominalSymmetryTest
### Title: Exact and Monte Carlo symmetry tests for paired contingency
###   tables
### Aliases: nominalSymmetryTest

### ** Examples

### 2 x 2 repeated matrix example
data(AndersonRainBarrel)
nominalSymmetryTest(AndersonRainBarrel)
                    
### 3 x 3 repeated matrix example with Monte Carlo
data(AndersonRainGarden)
nominalSymmetryTest(AndersonRainGarden,
                    MonteCarlo = TRUE,
                    ntrial     = 10000)
                    
### 4 x 4 repeated matrix example that fails with mcnemar.test
data(Religion)
nominalSymmetryTest(Religion,
                    MonteCarlo = TRUE,
                    ntrial     = 10000)
                                                              



