library(polyRAD)


### Name: AddGenotypeLikelihood
### Title: Estimate Genotype Likelihoods in a RADdata object
### Aliases: AddGenotypeLikelihood AddGenotypeLikelihood.RADdata
### Keywords: methods

### ** Examples

# load example dataset and add allele frequency
data(exampleRAD)
exampleRAD <- AddAlleleFreqHWE(exampleRAD)

# estimate genotype likelihoods
exampleRAD <- AddGenotypeLikelihood(exampleRAD)

# inspect the results
# the first ten individuals and first two alleles, assuming diploidy
exampleRAD$alleleDepth[1:10,1:2]
exampleRAD$genotypeLikelihood[[1]][,1:10,1:2]
# assuming tetraploidy
exampleRAD$genotypeLikelihood[[2]][,1:10,1:2]



