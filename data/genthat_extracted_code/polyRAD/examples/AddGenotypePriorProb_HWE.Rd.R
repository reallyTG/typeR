library(polyRAD)


### Name: AddGenotypePriorProb_HWE
### Title: Estimate Genotype Prior Probabilities In the Absence of
###   Population Structure
### Aliases: AddGenotypePriorProb_HWE AddGenotypePriorProb_HWE.RADdata
### Keywords: methods distribution

### ** Examples

# load in an example dataset
data(exampleRAD)
# add allele frequencies
exampleRAD <- AddAlleleFreqHWE(exampleRAD)
# add inheritance modes
exampleRAD$possiblePloidies <- list(2L, 4L, c(2L, 2L))

# estimate genotype prior probabilities
exampleRAD <- AddGenotypePriorProb_HWE(exampleRAD)

# examine results
exampleRAD$alleleFreq
exampleRAD$priorProb

# try it with inbreeding
exampleRAD2 <- AddGenotypePriorProb_HWE(exampleRAD, selfing.rate = 0.5)
exampleRAD2$priorProb



