library(PCMBase)


### Name: PCMMean
### Title: Expected mean vector at each tip conditioned on a trait-value
###   vector at the root
### Aliases: PCMMean

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

# create a random tree of 10 tips
tree <- ape::rtree(10)
PCMMean(tree, modelBM)



