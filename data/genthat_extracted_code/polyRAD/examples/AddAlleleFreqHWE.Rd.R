library(polyRAD)


### Name: AddAlleleFreqHWE
### Title: Estimate Allele Frequencies in a RADdata Object Assuming
###   Hardy-Weinberg Equilibrium
### Aliases: AddAlleleFreqHWE AddAlleleFreqHWE.RADdata
### Keywords: arith methods

### ** Examples

# load in an example dataset
data(exampleRAD)
exampleRAD

# add allele frequencies
exampleRAD <- AddAlleleFreqHWE(exampleRAD)
exampleRAD$alleleFreq



