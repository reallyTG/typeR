library(polyRAD)


### Name: CanDoGetWeightedMeanGeno
### Title: Check Whether 'GetWeightedMeanGenotypes' Can Be Run
### Aliases: CanDoGetWeightedMeanGeno
### Keywords: methods utilities

### ** Examples

data(exampleRAD)

CanDoGetWeightedMeanGeno(exampleRAD)

exampleRAD <- AddAlleleFreqHWE(exampleRAD)
exampleRAD <- AddGenotypePriorProb_HWE(exampleRAD)
exampleRAD <- AddGenotypeLikelihood(exampleRAD)
exampleRAD <- AddPloidyChiSq(exampleRAD)
exampleRAD <- AddGenotypePosteriorProb(exampleRAD)

CanDoGetWeightedMeanGeno(exampleRAD)



