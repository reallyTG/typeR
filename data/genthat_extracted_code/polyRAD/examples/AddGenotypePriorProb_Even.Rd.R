library(polyRAD)


### Name: AddGenotypePriorProb_Even
### Title: Add Uniform Priors to a RADdata Object
### Aliases: AddGenotypePriorProb_Even
### Keywords: methods distribution

### ** Examples

data(exampleRAD)

exampleRAD <- AddGenotypePriorProb_Even(exampleRAD)
exampleRAD$priorProb

# finish protocol to get genotypes
exampleRAD <- AddGenotypeLikelihood(exampleRAD)
exampleRAD <- AddPloidyChiSq(exampleRAD)
exampleRAD <- AddGenotypePosteriorProb(exampleRAD)

genmat <- GetWeightedMeanGenotypes(exampleRAD)
genmat



