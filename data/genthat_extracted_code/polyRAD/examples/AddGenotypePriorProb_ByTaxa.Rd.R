library(polyRAD)


### Name: AddGenotypePriorProb_ByTaxa
### Title: Estimate Prior Genotype Probabilities on a Per-Taxon Basis
### Aliases: AddGenotypePriorProb_ByTaxa
###   AddGenotypePriorProb_ByTaxa.RADdata
### Keywords: distribution methods

### ** Examples

# load data
data(exampleRAD)
# do PCA
exampleRAD <- AddPCA(exampleRAD, nPcsInit = 3)
# get allele frequencies
exampleRAD <- AddAlleleFreqByTaxa(exampleRAD)

# add prior probabilities
exampleRAD <- AddGenotypePriorProb_ByTaxa(exampleRAD)

exampleRAD$priorProb[[1]][,1,]
exampleRAD$priorProb[[2]][,1,]
exampleRAD$priorProb[[1]][,2,]
exampleRAD$priorProb[[2]][,2,]

# try it with inbreeding
exampleRAD <- AddGenotypePriorProb_ByTaxa(exampleRAD, selfing.rate = 0.5)

exampleRAD$priorProb[[1]][,1,]



