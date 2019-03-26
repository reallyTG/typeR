library(polyRAD)


### Name: AddAlleleFreqByTaxa
### Title: Estimate Local Allele Frequencies for Each Taxon Based on
###   Population Structure
### Aliases: AddAlleleFreqByTaxa AddAlleleFreqByTaxa.RADdata
### Keywords: regression methods

### ** Examples

# load data
data(exampleRAD)
# do PCA
exampleRAD <- AddPCA(exampleRAD, nPcsInit = 3)

# get allele frequencies
exampleRAD <- AddAlleleFreqByTaxa(exampleRAD)

exampleRAD$alleleFreqByTaxa[1:10,]



