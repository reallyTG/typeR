library(PCMBase)


### Name: PCMMeanAtTime
### Title: Calculate the mean at time t, given X0, under a PCM model
### Aliases: PCMMeanAtTime

### ** Examples

# a Brownian motion model with one regime
modelBM <- PCM(model = "BM", k = 2)
# print the model
modelBM
# assign the model parameters at random: this will use uniform distribution
# with boundaries specified by PCMParamLowerLimit and PCMParamUpperLimit
# We do this in two steps:
# 1. First we generate a random vector. Note the length of the vector equals PCMParamCount(modelBM)
randomParams <- PCMParamRandomVecParams(modelBM, PCMNumTraits(modelBM), PCMNumRegimes(modelBM))
randomParams
# 2. Then we load this random vector into the model.
PCMParamLoadOrStore(modelBM, randomParams, 0, PCMNumTraits(modelBM), PCMNumRegimes(modelBM), TRUE)

# PCMMeanAtTime(1, modelBM)

# note that the variance at time 0 is not the 0 matrix because the model has a non-zero
# environmental deviation
PCMMeanAtTime(0, modelBM)



