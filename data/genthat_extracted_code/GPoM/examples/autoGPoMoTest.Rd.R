library(GPoM)


### Name: autoGPoMoTest
### Title: Tests the numerical integrability of models and classify their
###   dynamical regime
### Aliases: autoGPoMoTest

### ** Examples

#Example
# Load data:
data('RosYco')
# Structure choice
data('allToTest')
# Test the models
outGPT <- autoGPoMoTest(RosYco, nVar= 3, dMax = 2, dt = 1/125, show=1,
                        allKL = allToTest, IstepMax = 60)




