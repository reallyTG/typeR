library(PCMBase)


### Name: PCM
### Title: Create a phylogenetic comparative model object
### Aliases: PCM

### ** Examples

# a Brownian motion model with one regime
modelBM <- PCM(model = "BM", k = 2)
# print the model
modelBM

# a BM model with two regimes
modelBM.ab <- PCM("BM", k = 2, regimes = c("a", "b"))
modelBM.ab

# print a single parameter of the model (in this case, the root value)
modelBM.ab$X0

# assign a value to this parameter (note that the brackets [] are necessary
# to preserve  the parameter attributes):
modelBM.ab$X0[] <- c(5, 2)

PCMNumTraits(modelBM)
PCMNumRegimes(modelBM)
PCMNumRegimes(modelBM.ab)

# number of numerical parameters in the model
PCMParamCount(modelBM)

# Get a vector representation of all parameters in the model
PCMParamGetShortVector(modelBM)

# Limits for the model parameters:
lowerLimit <- PCMParamLowerLimit(modelBM)
upperLimit <- PCMParamUpperLimit(modelBM)

# assign the model parameters at random: this will use uniform distribution
# with boundaries specified by PCMParamLowerLimit and PCMParamUpperLimit
# We do this in two steps:
# 1. First we generate a random vector. Note the length of the vector equals PCMParamCount(modelBM)
randomParams <- PCMParamRandomVecParams(modelBM, PCMNumTraits(modelBM), PCMNumRegimes(modelBM))
randomParams
# 2. Then we load this random vector into the model.
PCMParamLoadOrStore(modelBM, randomParams, 0, PCMNumTraits(modelBM), PCMNumRegimes(modelBM), TRUE)

print(modelBM)

PCMParamGetShortVector(modelBM)

# generate a random phylogenetic tree of 10 tips
tree <- ape::rtree(10)

#simulate the model on the tree
traitValues <- PCMSim(tree, modelBM, X0 = modelBM$X0)

# calculate the likelihood for the model parameters, given the tree and the trait values
PCMLik(traitValues, tree, modelBM)

# create a likelihood function for faster processing for this specific model.
# This function is convenient for calling in optim because it recieves and parameter
# vector instead of a model object.
likFun <- PCMCreateLikelihood(traitValues, tree, modelBM)
likFun(randomParams)



