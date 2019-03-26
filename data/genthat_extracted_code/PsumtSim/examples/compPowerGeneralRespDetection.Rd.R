library(PsumtSim)


### Name: compPowerGeneralRespDetection
### Title: Compute power to detect differences from background where all
###   categories differ from background.
### Aliases: compPowerGeneralRespDetection
### Keywords: datagen

### ** Examples

# Simulate responses in 3 of 6 categories and compute how often these responses 
# are detected. Will return a random number generally between 10 and 15, so 
# the estimate of power would be between 20% and 30%.
require(EffectsRelBaseline)
require(boot)
compPowerGeneralRespDetection(1,1,2,6,3,numBootIters=50,numRuns=25)



